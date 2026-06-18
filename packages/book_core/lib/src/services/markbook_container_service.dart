import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;

class MarkBookContainerService {
  static const extension = '.markbook';
  static const manifestFileName = 'markbook.json';

  Future<void> packDirectory({
    required String sourceDirectoryPath,
    required String outputFilePath,
  }) async {
    _assertMarkBookExtension(outputFilePath);

    final sourceDirectory = Directory(sourceDirectoryPath);

    if (! sourceDirectory.existsSync()) {
      throw FormatException(
        'Source directory does not exist: $sourceDirectoryPath',
      );
    }

    final manifestFile = File(p.join(sourceDirectoryPath, manifestFileName));

    if (! manifestFile.existsSync()) {
      await manifestFile.writeAsString(
        const JsonEncoder.withIndent('  ').convert({
          'format': 'markbook',
          'formatVersion': 1,
          'createdBy': 'MarkBook Publisher',
          'minimumAppVersion': '0.1.0',
          'configPath': 'book.config.json',
        }),
      );
    }

    final encoder = ZipFileEncoder()
    ..create(outputFilePath);

    await for (final entity in sourceDirectory.list(recursive: true)) {
      if (entity is! File) {
        continue;
      }

      final relativePath = p.relative(
        entity.path,
        from: sourceDirectoryPath,
      );

      if (_shouldSkip(relativePath)) {
        continue;
      }

      await encoder.addFile(entity, relativePath);
    }

    await encoder.close();
  }

  Future<String> unpackToDirectory({
    required String markBookFilePath,
    required String destinationDirectoryPath,
    bool overwrite = true,
  }) async {
    _assertMarkBookExtension(markBookFilePath);

    final markBookFile = File(markBookFilePath);

    if (! markBookFile.existsSync()) {
      throw FormatException('MarkBook file does not exist: $markBookFilePath');
    }

    final destinationDirectory = Directory(destinationDirectoryPath);

    if (overwrite &&  destinationDirectory.existsSync()) {
      await destinationDirectory.delete(recursive: true);
    }

    await destinationDirectory.create(recursive: true);

    final bytes = await markBookFile.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    for (final file in archive) {
      final outputPath = _safeJoin(destinationDirectoryPath, file.name);

      if (file.isFile) {
        final outputFile = File(outputPath);
        await outputFile.parent.create(recursive: true);
        await outputFile.writeAsBytes(file.content as List<int>);
      } else {
        await Directory(outputPath).create(recursive: true);
      }
    }

    await _validateExtractedProject(destinationDirectoryPath);

    return destinationDirectoryPath;
  }

  Future<void> _validateExtractedProject(String directoryPath) async {
    final manifest = File(p.join(directoryPath, manifestFileName));
    final config = File(p.join(directoryPath, 'book.config.json'));

    if (! manifest.existsSync()) {
      throw const FormatException('Invalid .markbook: missing markbook.json.');
    }

    if (! config.existsSync()) {
      throw const FormatException(
        'Invalid .markbook: missing book.config.json.',
      );
    }

    final decoded = jsonDecode(await manifest.readAsString());

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid markbook.json.');
    }

    if (decoded['format'] != 'markbook') {
      throw const FormatException('Invalid markbook format.');
    }

    if (decoded['formatVersion'] != 1) {
      throw FormatException(
        'Unsupported MarkBook format version: ${decoded['formatVersion']}',
      );
    }
  }

  String _safeJoin(String rootPath, String entryName) {
    final normalizedRoot = p.normalize(p.absolute(rootPath));
    final outputPath = p.normalize(p.absolute(p.join(rootPath, entryName)));

    final isInsideRoot =
        outputPath == normalizedRoot || p.isWithin(normalizedRoot, outputPath);

    if (!isInsideRoot) {
      throw FormatException('Unsafe archive path: $entryName');
    }

    return outputPath;
  }

  void _assertMarkBookExtension(String filePath) {
    if (p.extension(filePath).toLowerCase() != extension) {
      throw FormatException('Expected a $extension file: $filePath');
    }
  }

  bool _shouldSkip(String relativePath) {
    final normalized = p.normalize(relativePath);

    return normalized.startsWith('output/') ||
        normalized == '.DS_Store' ||
        normalized.endsWith('/.DS_Store');
  }
}
