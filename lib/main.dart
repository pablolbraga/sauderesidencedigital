import 'package:flutter/material.dart';
import 'package:sauderesidencedigital/views/Agenda.dart';
import 'package:sauderesidencedigital/views/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        'Agenda' : (Context) => Agenda()
      },
    );
  }
}
