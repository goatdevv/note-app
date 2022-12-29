import 'package:expense_note/app.dart';

import 'package:expense_note/domain/hive/hive_keys.dart';
import 'package:expense_note/domain/hive/note_data.dart';
import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: AppColors.mainColor,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(NoteDataAdapter());
  await Hive.openBox<NoteData>(HiveKeys.notesKey);

  runApp(const ExpenseNoteApp());
}
