import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frapp/screens/logthere.dart';

class Login extends StatefulWidget {
  Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  var intialLogin = '';
  var intialPassword = '';
  final _form = GlobalKey<FormState>();
  var _isdisable = false;
  @override
  void dispose() {
    loginFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: const Text('You are sccusuflly log in'),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _savedForm() {
    final isvalid = _form.currentState!.validate();
    if (!isvalid) {
      setState(() {
        _isdisable = true;
      });
      return;
    }

    _form.currentState?.save();
    setState(() {
      _isdisable = false;
    });

    Navigator.of(context).pushNamed(LogThere.routName);
    _showMyDialog();
  }

  @override
  Widget build(BuildContext context) {
    print(_isdisable);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              key: _form,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Login')),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    onSaved: (value) {
                      intialLogin = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The username is requierd !';
                      }
                      if (value.length < 8) {
                        return 'The lenthe of String must be superier a 8 caracter !';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(label: Text('Password')),
                    onFieldSubmitted: (_) {
                      _savedForm();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: passwordFocusNode,
                    onSaved: (value) {
                      intialPassword = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                    },
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: _isdisable
                          ? AbsorbPointer(
                              absorbing: false,
                              child: RaisedButton(
                                disabledTextColor: Colors.white,
                                disabledColor: Colors.orange,
                                disabledElevation: 0.0,
                                onPressed: () {
                                  _savedForm();
                                },
                                child: const Text('Login'),
                              ))
                          : RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                _savedForm();
                              },
                              child: const Text('Login'),
                            )),
                ],
              ))),
    );
  }
}
