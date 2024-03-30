import 'package:firebase_core/firebase_core.dart';
import 'package:first/firebase_options.dart';
import 'package:first/first.dart';
import 'package:first/second.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'First',
    routes: {
      'First' : (context) => first(),
      'second' : (context) => second(),
    },
  ));
}
