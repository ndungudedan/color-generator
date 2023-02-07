import 'package:color_generator/index.dart';
import 'package:flutter/material.dart';

///First App Entry point that builds the root widget
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Color Generator',
      home: IndexScreen(),
    );
  }
}
