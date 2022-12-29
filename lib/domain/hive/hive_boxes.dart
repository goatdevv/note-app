import 'package:expense_note/domain/hive/hive_keys.dart';
import 'package:expense_note/domain/hive/note_data.dart';
import 'package:hive/hive.dart';

abstract class HiveBoxes {
  static final Box<NoteData> notes = Hive.box<NoteData>(HiveKeys.notesKey);
}
