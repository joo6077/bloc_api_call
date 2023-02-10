import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/list/list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.light,
        ],
        textTheme: JTextTheme.light,
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.dark,
        ],
      ),
      home: Scaffold(
        backgroundColor: Color(0xffefefef),
        body: SafeArea(child: ListPage()),
      ),
    );
  }
}
