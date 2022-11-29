import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    title = widget.data['title'];
    description = widget.data['description'];
    return Scaffold();
  }
}
