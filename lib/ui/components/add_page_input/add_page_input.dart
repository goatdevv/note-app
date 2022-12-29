import 'package:expense_note/domain/providers/note_provider.dart';
import 'package:expense_note/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPageInput extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const AddPageInput({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: TextField(
        maxLines: null,
        controller: model.noteController,
        decoration: InputDecoration(
          label: Text(
            title,
            style: AppTextStyle.notesStyle,
          ),
          hintText: 'Заметка...',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
