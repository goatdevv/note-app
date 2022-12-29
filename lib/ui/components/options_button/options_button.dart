import 'package:expense_note/domain/providers/note_provider.dart';
import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:expense_note/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionBtn extends StatelessWidget {
  const OptionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    final index = ModalRoute.of(context)?.settings.arguments;
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        PopupMenuItem(
          child: const Text('Удалить'),
          onTap: () {
            if (index is int) {
              model.deleteNote(index, context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.mainColor,
                  content: Text(
                    'Заметка удалена',
                    style: AppTextStyle.notesStyle,
                  ),
                ),
              );
              model.clearControllers();
            }
          },
        ),
        const PopupMenuItem(
          child: Text('Информация'),
        )
      ],
      icon: const Icon(Icons.more_vert_rounded),
    );
  }
}
