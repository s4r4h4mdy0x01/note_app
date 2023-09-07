import 'package:flutter/material.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgets/body_edit_note_view.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BodyEditNote(note: note),
    );
  }
}
