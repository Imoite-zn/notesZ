import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/models/note.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;

  //Initialize database
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,);
  }

  //list of notes
  final List<Note> currentNotes = [];

  //create a note and save to database
  Future<void> addNote(String textFromUser) async{

    //create new note
    final newNote = Note()..text = textFromUser;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

  }
  //read notes from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //update
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if(existingNote != null ) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
    
  }


  //delete
  Future<void>deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}