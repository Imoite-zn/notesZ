// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {

  void Function()? onEditTap;
  void Function()? onDeleteTap;
   NoteSettings({
    super.key,
    required this.onEditTap,
    required this.onDeleteTap,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //edit option
        GestureDetector(
          onTap: (){
            Navigator.pop(context);

            onEditTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                'edit',
                ),
                ),
          ),
        ),
        //delete option
        GestureDetector(
          onTap: (){
            Navigator.pop(context);

            onDeleteTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                'delete'
                ),
                ),
          ),
        ),
      ],
    );
  }
}