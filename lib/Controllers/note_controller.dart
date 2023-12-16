import 'package:flutter_application_14/Models/note_models.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class NoteController extends GetxController {
  /*
  //Lesson 15 need
  List<NoteModel> notes = [];
  */

  final Box box = Hive.box('notes');

  void createNote(NoteModel note) {
    //notes.add(note); [lesson 15]
    box.add(note);
    //update(); [lesson 15]
  }

  void updateNote(NoteModel note, int index) {
    /*
    notes[index] = note;
    update();
    */
    box.putAt(index, note);
  }

  void deleteNote(int index) {
    /*
    notes.removeAt(index);
    update();
    */
    box.deleteAt(index);
  }
}
