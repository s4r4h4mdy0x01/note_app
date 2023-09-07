import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/cubits/cubit_note/notes_state.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgets/constWidget.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? note;
  fetchAllNote() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    note = noteBox.values.toList();
    emit(NotesSuccess());
  }
}
