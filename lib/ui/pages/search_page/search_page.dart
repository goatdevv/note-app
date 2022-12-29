import 'package:expense_note/domain/hive/hive_boxes.dart';
import 'package:expense_note/domain/hive/note_data.dart';
import 'package:expense_note/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:expense_note/ui/components/homepage_note_list/homepage_note_list.dart';
import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:expense_note/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _notes = HiveBoxes.notes.values.toList();
  var filteredList = <NoteData>[];
  final searchController = TextEditingController();

  void _searchNote() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredList = _notes.where(
        (NoteData noteList) {
          return noteList.description
              .toLowerCase()
              .contains(query.toLowerCase());
        },
      ).toList();
    } else {
      filteredList = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredList = _notes;
    searchController.addListener(_searchNote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (searchController.text.isEmpty) {
                Navigator.of(context).pop();
              } else {
                searchController.clear();
              }
            },
            icon: const Icon(Icons.close_rounded),
          ),
        ],
        title: TextField(
          cursorColor: Colors.black,
          maxLines: 1,
          controller: searchController,
          style: AppTextStyle.titleAppBarStyle,
          decoration: const InputDecoration(
            hintText: 'Поиск...',
            hintStyle: TextStyle(fontSize: 22, color: AppColors.textColor),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
        centerTitle: true,
        flexibleSpace: const AppBarShadow(),
      ),
      body: ValueListenableBuilder(
        builder: (context, Box<NoteData> box, child) {
          return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final noteItem = filteredList[index];
                return NoteListItem(
                    date: noteItem.date,
                    index: index,
                    note: noteItem.description,
                    title: noteItem.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: filteredList.length);
        },
        valueListenable: HiveBoxes.notes.listenable(),
      ),
    );
  }
}
