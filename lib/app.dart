import 'package:expense_note/domain/providers/note_provider.dart';
import 'package:expense_note/ui/app_navigator/app_navigator.dart';
import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseNoteApp extends StatelessWidget {
  const ExpenseNoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true,
          // appBarTheme: const AppBarTheme(
          //   color: AppColors.mainColor,
          //   iconTheme: IconThemeData(color: AppColors.buttonColor),
          //   toolbarHeight: 64,
          // ),
        ),
        routes: AppNavigator.routes,
        initialRoute: AppNavigator.initialRoute,
      ),
    );
  }
}
