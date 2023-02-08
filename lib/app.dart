import 'package:color_generator/screens/index_screen.dart';
import 'package:flutter/material.dart';

/// Renders the app root widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Color Generator',
      home: IndexScreen(),
    );
  }
}
