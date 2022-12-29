import 'package:expense_note/ui/app_navigator/app_routes.dart';
import 'package:expense_note/ui/pages/add_note_page/add_note_page.dart';
import 'package:expense_note/ui/pages/edit_page/edit_page.dart';
import 'package:expense_note/ui/pages/home_page/home_page.dart';
import 'package:expense_note/ui/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static String get initialRoute => AppRoutes.home;
  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.addNotePage: (context) => const AddNotePage(),
        AppRoutes.editPage: (context) => const EditPage(),
        AppRoutes.searchPage: (context) => const SearchPage(),
      };
}
