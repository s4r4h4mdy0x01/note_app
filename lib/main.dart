import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubits/cubit_add_note/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit_note/notes_cubit.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/helper/simple_bloc_observer.dart';
import 'package:note_app/views/note_view.dart';
import 'package:note_app/widgets/constWidget.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
        ),
        home: const NoteView(),
      ),
    );
  }
}
