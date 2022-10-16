import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Textfild.dart';

class Flied extends StatefulWidget {
  static const routeName = "/";

  Flied();

  @override
  State<Flied> createState() => _FliedState();
}

class _FliedState extends State<Flied> {
  double result = 0.0;

  final _FirstController = TextEditingController();
  final _LastController = TextEditingController();
  final _operationController = TextEditingController();
  void _submitData() {
    print(result);
    if (_FirstController.text.isEmpty || _LastController.text.isEmpty) {
      return;
    }

    final FirstNumber = double.parse(_FirstController.text);
    print(FirstNumber);
    final SecondNumber = double.parse(_LastController.text);
    print(SecondNumber);
    final StringOperation = _operationController.text as String;
    switch (StringOperation) {
      case '+':
        {
          setState(() {
            result = FirstNumber + SecondNumber;
          });
        }
        break;

      case '-':
        {
          setState(() {
            result = FirstNumber - SecondNumber;
          });
        }
        break;
      case '/':
        {
          setState(() {
            result = FirstNumber / SecondNumber;
          });
        }
        break;
      case '*':
        {
          setState(() {
            result = FirstNumber * SecondNumber;
          });
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TextFiled(_submitData, _FirstController, _LastController,
              _operationController),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('calculatrice'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ]),
      body: Container(
        child: Center(
            child: Text(
          '${result.toInt()}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
