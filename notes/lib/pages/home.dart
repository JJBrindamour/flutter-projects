import 'package:flutter/material.dart';
import 'package:notes/pages/note.dart';
import 'package:notes/widgets/notecard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Notecard> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return notes[index].getNote();},)
              },
              onLongPress: () {
                setState(() {
                  notes.removeAt(index);
                });
              },
              child: notes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildNoteDialog(context),
          );
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildNoteDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    return AlertDialog(
      title: const Text('Add Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: const TextStyle(fontSize: 14),
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: 'Title',
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(fontSize: 12),
            controller: contentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: 'Content',
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            setState(() {
              notes.add(
                Notecard(
                  title: titleController.text,
                  content: contentController.text,
                ),
              );
            });
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
