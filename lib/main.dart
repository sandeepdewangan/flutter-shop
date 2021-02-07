import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Application',
      home: Scaffold(
        appBar: AppBar(
          title: Text('e-Shop'),
        ),
        body: Container(
          child: Text('eShopp'),
        ),
      ),
    );
  }
}
