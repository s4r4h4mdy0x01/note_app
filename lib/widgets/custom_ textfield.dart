import 'package:flutter/material.dart';
import 'package:note_app/widgets/constWidget.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      this.max = 1,
      this.onsaved,
      this.onChanged});
  final String hint;
  final int max;
  final void Function(String?)? onsaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onSaved: onsaved,
      onChanged: onChanged,
      cursorColor: kColor,
      maxLines: max,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kColor),
        border: borderOutlineInput(),
        focusedBorder: borderOutlineInput(kColor),
        enabledBorder: borderOutlineInput(),
      ),
    );
  }

  OutlineInputBorder borderOutlineInput([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
