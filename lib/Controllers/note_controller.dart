import 'package:flutter_application_14/Models/note_models.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [];

  void createNote(NoteModel note) {
    notes.add(note);
    update();
  }
}
