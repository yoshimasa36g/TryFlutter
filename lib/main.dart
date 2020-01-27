import 'package:flutter/material.dart';
import 'package:try_flutter/ui/UsersView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Try Flutter',
      home: UsersView(),
    );
  }
}
