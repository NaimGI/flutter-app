import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFiled extends StatefulWidget {
  final TextEditingController firstName;
  final VoidCallback submit;
  final TextEditingController secondName;
  final TextEditingController operation;
  TextFiled(this.submit, this.firstName, this.secondName, this.operation);

  @override
  State<TextFiled> createState() => _TextFiledState();
}

class _TextFiledState extends State<TextFiled> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'First Number'),
                controller: widget.firstName,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => widget.submit(),
                // onChanged: (val) => amountInput = val,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Second Number'),
                controller: widget.secondName,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => widget.submit(),
                // onChanged: (val) => amountInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'operation'),
                controller: widget.operation,
                onSubmitted: (_) => widget.submit(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              RaisedButton(
                child: Text('Calculer'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.black,
                onPressed: () {},
              ),
            ]),
      ),
    );
  }
}
