import 'package:expense_note/domain/providers/note_provider.dart';
import 'package:expense_note/ui/components/add_page_input/add_page_input.dart';
import 'package:expense_note/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:expense_note/ui/components/options_button/options_button.dart';
import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:expense_note/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    final index = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: 'Изменить',
            onPressed: () {
              if (index is int) {
                model.changeNoteData(index, context);
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.mainColor,
                  content: Text(
                    'Заметка изменена',
                    style: AppTextStyle.notesStyle,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.save),
          ),
          const OptionBtn(),
        ],
        flexibleSpace: const AppBarShadow(),
        title: TextField(
          maxLines: 1,
          controller: model.titleController,
          style: AppTextStyle.titleAppBarStyle,
          decoration: const InputDecoration(
            hintText: 'Заголовок...',
            hintStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff323232),
            ),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          cursorColor: Colors.black,
        ),
      ),
      body: AddPageInput(
        title: '',
        controller: model.noteController,
      ),
    );
  }
}
