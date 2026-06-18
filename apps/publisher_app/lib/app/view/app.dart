import 'package:flutter/material.dart';
import 'package:publisher_app/features/editor/presentation/editor_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1E293B),
      ),
      home: const EditorPage(),
    );
  }
}
