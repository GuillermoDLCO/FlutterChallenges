import 'package:flutter/material.dart';
import 'package:flutterchallenges/theme/pallete_color.dart';

class ActionButton extends StatelessWidget {
  ActionButton({
    Key? key,
    required this.action,
    required this.label,
  }) : super(key: key);

  final VoidCallback action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: this.action,
          style: ElevatedButton.styleFrom(
            primary: PalleteColor.actionButtonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          child: Text(this.label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
