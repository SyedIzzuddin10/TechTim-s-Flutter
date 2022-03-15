// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, prefer_const_constructors_in_immutables, unnecessary_new, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final userName = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    userName.dispose();
  }

  void click() {
    widget.callback(userName.text);
    FocusScope.of(context).unfocus();
    userName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: userName,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.message,
            ),
            labelText: 'Enter name',
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              color: Colors.blue,
              splashColor: Colors.green,
              tooltip: 'Enter your name',
              onPressed: click,
            ),
          ),
        ),
      ],
    );
  }
}
