import 'package:expense_note/domain/providers/note_provider.dart';
import 'package:expense_note/ui/app_navigator/app_routes.dart';
import 'package:expense_note/ui/components/app_bar_shadow/app_bar_shadow.dart';
import 'package:expense_note/ui/components/homepage_note_list/homepage_note_list.dart';
import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:expense_note/ui/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos',
          style: AppTextStyle.titleAppBarStyle,
        ),
        flexibleSpace: const AppBarShadow(),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.searchPage);
            },
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.buttonColor,
            ),
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: AppColors.buttonColor,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        margin: const EdgeInsets.only(bottom: 20, right: 10),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: AppColors.addButtonColor,
          child: const Icon(Icons.add_rounded,
              color: AppColors.mainColor, size: 36),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.addNotePage);
            model.clearControllers();
          },
        ),
      ),
      body: const GridViews(),
    );
  }
}
