import 'package:flutter/material.dart';
import 'package:to_do_app/components/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
            child: Icon(Icons.note_alt_outlined),
          ),
            //notes tile
            DrawerTile(
              title: "Notes", 
              leading: Icon(Icons.note_rounded), 
              onTap: (){
                Navigator.pop(context);
              }
              ),

            //settings tile
            DrawerTile(
              title: "Settings", 
              leading: Icon(Icons.settings), 
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              }
              )
      
        ],
      )
    );
  }
}