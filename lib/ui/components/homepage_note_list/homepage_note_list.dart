import 'package:expense_note/domain/hive/hive_boxes.dart';
import 'package:expense_note/domain/hive/note_data.dart';
import 'package:expense_note/domain/providers/note_provider.dart';
import 'package:expense_note/ui/app_navigator/app_routes.dart';
import 'package:expense_note/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class GridViews extends StatelessWidget {
  const GridViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HiveBoxes.notes.listenable(),
        builder: (context, Box<NoteData> box, _) {
          final noteList = box.values.toList();
          return HiveBoxes.notes.length > 0
              ? MasonryGridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  itemBuilder: (context, index) => NoteListItem(
                    index: index,
                    date: noteList[index].date,
                    title: noteList[index].title,
                    note: noteList[index].description,
                  ),
                  itemCount: noteList.length,
                )
              : const Center(
                  child: Text(
                    'Нет заметок',
                    style: AppTextStyle.titleAppBarStyle,
                  ),
                );
        });
  }
}

class NoteListItem extends StatelessWidget {
  final String date;
  final String title;
  final String note;
  final int index;
  const NoteListItem(
      {super.key,
      required this.index,
      required this.title,
      required this.note,
      required this.date});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return GestureDetector(
      onTap: () {
        model.setControllers(index);
        Navigator.of(context).pushNamed(AppRoutes.editPage, arguments: index);
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 15,
          top: 30,
          right: 20,
          bottom: 5,
        ),
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 5,
              color: Color.fromRGBO(
                0,
                0,
                0,
                0.1,
              ),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xffe0eafd),
              Color(0xffb2cbee),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: AppTextStyle.titleAppBarStyle,
            ),
            Text(
              date,
              style: AppTextStyle.notesStyle,
            ),
            Text(
              note,
              style: AppTextStyle.notesStyle,
            ),
          ],
        ),
      ),
    );
  }
}
