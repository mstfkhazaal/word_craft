class BookChapter {
  const BookChapter({
    required this.title,
    required this.path,
    required this.order,
    required this.markdown,
  });

  factory BookChapter.fromJson(Map<String, dynamic> json) {
    return BookChapter(
      title: json['title'] as String,
      path: json['path'] as String,
      order: json['order'] as int,
      markdown: json['markdown'] as String? ?? '',
    );
  }

  final String title;
  final String path;
  final int order;
  final String markdown;

  Map<String, dynamic> toConfigJson() {
    return {
      'title': title,
      'path': path,
      'order': order,
    };
  }

  BookChapter copyWith({
    String? title,
    String? path,
    int? order,
    String? markdown,
  }) {
    return BookChapter(
      title: title ?? this.title,
      path: path ?? this.path,
      order: order ?? this.order,
      markdown: markdown ?? this.markdown,
    );
  }
}
