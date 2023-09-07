import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn_platform_interface.dart';
import 'package:note_app/cubits/cubit_add_note/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit_add_note/add_notes_state.dart';
import 'package:note_app/cubits/cubit_note/notes_cubit.dart';
import 'package:note_app/widgets/add-note_form.dart';
import 'package:note_app/widgets/constWidget.dart';
import 'package:note_app/widgets/custom_%20textfield.dart';
import 'package:note_app/widgets/custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesFailture) {
            print('failied ${state.messageError}');
          }
          if (state is AddNotesSuccess) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNote();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
   
  }
}
