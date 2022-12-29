import 'package:expense_note/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppBarShadow extends StatelessWidget {
  const AppBarShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(18, 14, 66, 0.05),
            blurRadius: 35,
            spreadRadius: 35,
          ),
        ],
      ),
    );
  }
}
