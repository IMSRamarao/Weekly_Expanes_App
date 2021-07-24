import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdapativeFlatButton extends StatelessWidget {
  final String text;
  final Function adapative;
  AdapativeFlatButton(this.text, this.adapative);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            onPressed: adapative,
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: adapative,
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
  }
}