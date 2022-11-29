import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/note.dart';

class FirebaseNoteService {

  FirebaseNoteService.privateCon();

  static final FirebaseNoteService instance = FirebaseNoteService.privateCon();
  CollectionReference reference =
      FirebaseFirestore.instance.collection('notes');

  static addNote(String title, String description) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('notes');
    var data = {'title' : title, 'description' : description};
    reference.add(data);

    print(data);
  }


}
