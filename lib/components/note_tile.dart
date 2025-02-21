// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:to_do_app/components/note_settings.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? deleteNotePressed;
  final void Function()? updateNotePressed;

    const NoteTile({
    super.key,
    required this.text,
    required this.deleteNotePressed,
    required this.updateNotePressed,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10),
      child: ListTile(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      title: Text(text),
      trailing: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () =>showPopover(
              width: 100,
              height: 100,
              backgroundColor: Theme.of(context).colorScheme.surface,
              context: context,
              bodyBuilder: (context) => NoteSettings(
                onEditTap: updateNotePressed ,
                onDeleteTap: deleteNotePressed,
              ),
            ), 
            icon: Icon(Icons.more_vert) 
            );
        }
      ),
    
      ),
    );
  }
}