import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  _NoteState createState() => _NoteState();

  Widget get getNote {
    return Note(title: title, content: content);
  }
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
