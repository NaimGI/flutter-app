import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LogThere extends StatefulWidget {
  static const routName = '/anwar';
  LogThere();

  @override
  State<LogThere> createState() => _LogThereState();
}

class _LogThereState extends State<LogThere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app'),
      ),
      body: Center(
        child: Text('You are log in !'),
      ),
    );
  }
}
