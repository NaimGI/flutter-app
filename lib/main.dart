import 'package:flutter/material.dart';
import 'package:frapp/screens/loginScreen.dart';
import 'package:frapp/screens/logthere.dart';
import 'package:frapp/widget/field.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)))),
      home: Login(),
      routes: {LogThere.routName: (ctx) => LogThere()},
    );
  }
}
