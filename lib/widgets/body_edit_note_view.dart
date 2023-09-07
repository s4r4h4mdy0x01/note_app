import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_note/notes_cubit.dart';
import 'package:note_app/helper/show_message.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgets/color_list_view.dart';
import 'package:note_app/widgets/constWidget.dart';
import 'package:note_app/widgets/custom_%20textfield.dart';
import 'package:note_app/widgets/custom_app_bar.dart';

class BodyEditNote extends StatefulWidget {
  const BodyEditNote({super.key, required this.note});
  final NoteModel note;

  @override
  State<BodyEditNote> createState() => _BodyEditNoteState();
}

class _BodyEditNoteState extends State<BodyEditNote> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNote();
                showMessage(context, 'Success edit note');
                Navigator.pop(context);
            
              },
              text: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldCustom(
              onChanged: (value) {
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldCustom(
              onChanged: (value) {
                subTitle = value;
              },
              hint: 'Content',
              max: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            EditColorListView(note: widget.note),
          ],
        ),
      ),
    );
  }
}

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  widget.note.color = kColors[index].value;

                  setState(() {});
                },
                child: Coloritem(
                  color: kColors[index],
                  isChose: currentIndex == index,
                )),
          );
        },
      ),
    );
  }
}
