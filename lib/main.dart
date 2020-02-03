import 'package:chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  runApp(MyApp());

  Firestore.instance.collection('messages').snapshots().listen((onData) {
    onData.documents.forEach((d) {
      print(d.data);
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}