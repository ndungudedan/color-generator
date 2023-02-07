import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Color Generator'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Text('Randomize'),),
    );
  }
}
