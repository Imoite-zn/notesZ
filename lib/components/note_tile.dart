import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? deleteNote;
  final void Function()? updateNote;

    NoteTile({
    super.key,
    required this.text,
    required this.deleteNote,
    required this.updateNote,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               IconButton(
            onPressed: updateNote, 
            icon: Icon(Icons.edit)
            ),
          IconButton(
            onPressed: deleteNote, 
            icon: Icon(Icons.delete)
            ),
            ],
          )
        ],
      ),
    );
  }
}