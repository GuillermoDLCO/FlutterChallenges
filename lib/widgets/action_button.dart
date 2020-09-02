import 'package:flutter/material.dart';
import 'package:flutterchallenges/res/pallete_color.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback action;
  final String label;

  ActionButton({Key key, @required this.action, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: RaisedButton(
          onPressed: this.action,
          color: PalleteColor.actionButtonColor,
          child: Text(this.label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
