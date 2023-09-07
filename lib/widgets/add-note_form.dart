import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/cubit_add_note/add_notes_cubit.dart';
import 'package:note_app/cubits/cubit_add_note/add_notes_state.dart';
import 'package:note_app/helper/show_message.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgets/color_list_view.dart';
import 'package:note_app/widgets/custom_%20textfield.dart';
import 'package:note_app/widgets/custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextFieldCustom(
            onsaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldCustom(
            onsaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            max: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorListViem(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var notes = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateFormat.yMd().format(DateTime.now()),
                        color: Colors.amber.value);
                    BlocProvider.of<AddNotesCubit>(context).addNotes(notes);
                    showMessage(context, "Success add note");
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 33,
          ),
        ],
      ),
    );
  }
}
