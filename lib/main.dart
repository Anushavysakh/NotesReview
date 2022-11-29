import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:review_project/pages/home_page.dart';

import 'model/note.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  MaterialApp(home: HomePage()));
}




