import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:review_project/firebase_note_service.dart';
import 'package:review_project/model/note.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  final DocumentReference ref;

  const ViewNote({super.key, required this.data, required this.ref});

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String? title;
  String? description;
  bool isEdit = true;

  Future<void> delete() async {
   await widget.ref.delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    title = widget.data['title'];
    description = widget.data['description'];
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                isEdit = !isEdit;
              },
              child: Icon(Icons.edit)),
          ElevatedButton(onPressed: () {delete();}, child: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: title,
              enabled: isEdit,
            ),
            TextFormField(
              initialValue: description,
              enabled: isEdit,
            ),
          ],
        ),
      ),
    );
  }
}
