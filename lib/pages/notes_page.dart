import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/my_drawer.dart';
import 'package:to_do_app/models/note.dart';
import 'package:to_do_app/models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  //track user input
  final textController = TextEditingController();

  @override
  void initState(){
    super.initState();

  //fetch existing notes
    readNotes();
  }

  //create note
  void createNote() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: TextField(
          decoration: InputDecoration(hintText: 'Enter note'),
          controller: textController,
        ),
        actions: [
          //cancle button
           MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancle'),
            ),
          //create btn
          MaterialButton(
            onPressed: () {
              //add to db
              context.read<NoteDatabase>().addNote(textController.text);

              //clear controller
              textController.clear();

              Navigator.pop(context);
            },
            child: Text('create'),
            )
        ],
      )
      );
  }

  //read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note) {
    //prefill with current selected
    textController.text = note.text;
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text('Update note'),
        content: TextField(
          controller: textController,
        ),
        actions: [
          //update button
          MaterialButton(
            onPressed: () {
              //update note in db
              context.read<NoteDatabase>().updateNote(note.id, textController.text);

              textController.clear();

              Navigator.pop(context);
            },
            child: const Text('Update'),
            )

        ],
      ),
      );
  }

  //delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }


  @override
  Widget build(BuildContext context) {

    // note db
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return  Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: FloatingActionButton(
          onPressed: createNote,
          child: Icon(Icons.add),
          ),
        
        drawer: MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Notes',
                style: GoogleFonts.dmSerifText(
                  fontSize: 35,
                  color: Theme.of(context).colorScheme.inversePrimary
                   ),
              ),
            ),
            ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
            
                  //get individual note
                  final note = currentNotes[index];
            
                  //list tile UI
                  return ListTile(
                    title: Text(note.text),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //edit button
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            //edit note 
                            updateNote(note);
                            },
                            ),
                        //delete button
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            //edit note 
                            deleteNote(note.id);
                            },
                            ),
                      ],
                    ),
                  );
              }
              ),
          ],
        ),
    );
  }
}