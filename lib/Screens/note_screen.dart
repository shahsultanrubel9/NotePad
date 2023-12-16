import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/Controllers/note_controller.dart';
import 'package:flutter_application_14/Models/note_models.dart';
import 'package:get/get.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({super.key});

  Color brownColor = Colors.brown;
  TextEditingController idClt = TextEditingController();
  TextEditingController nameClt = TextEditingController();
  TextEditingController deptClt = TextEditingController();

  NoteController noteController =
      Get.put(NoteController()); //Model Class Controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Notes')),
        backgroundColor: brownColor,
        elevation: 2.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogue(context);
        },
        backgroundColor: brownColor,
        child: Icon(Icons.add),
      ),

      ///==============Body GetBuilder=======================
      body: GetBuilder<NoteController>(
        builder: (_) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(noteController.notes[index].id),
                    title: Text(noteController.notes[index].name),
                    subtitle: Text(noteController.notes[index].department),
                  ),
                );
              });
        },
      ),
    );
  }

  ///==================showDialogu=========================

  _showDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                content: Column(
                  children: [
                    TextField(
                      controller: idClt,
                      decoration: InputDecoration(hintText: 'Student Id'),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: nameClt,
                      decoration: InputDecoration(hintText: 'Student Name'),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: deptClt,
                      decoration:
                          InputDecoration(hintText: 'Student Department'),
                    )
                  ],
                ),
                actions: [
                  //================Cancel Button======================================
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                  ),
                  //================Submit Button=====================================
                  ElevatedButton(
                    onPressed: () {
                      noteController.createNote(
                          NoteModel(idClt.text, nameClt.text, deptClt.text));
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: brownColor),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
