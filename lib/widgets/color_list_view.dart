import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_add_note/add_notes_cubit.dart';
import 'package:note_app/widgets/constWidget.dart';

class Coloritem extends StatelessWidget {
  const Coloritem({super.key, required this.isChose, required this.color});
  final bool isChose;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isChose
        ? CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 29,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 29,
          );
  }
}

class ColorListViem extends StatefulWidget {
  const ColorListViem({super.key});

  @override
  State<ColorListViem> createState() => _ColorListViemState();
}

class _ColorListViemState extends State<ColorListViem> {
  int currentIndex = 0;
  

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
                  BlocProvider.of<AddNotesCubit>(context).color = kColors[index];
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
