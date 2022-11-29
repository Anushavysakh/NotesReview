import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  void add(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        TextField(
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Description'),
        ),
      ]),
    );
  }
}
