import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/color_scheme.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class PatternAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String label;
  final bool backButtonOfInsert;
  const PatternAppBar({super.key,
  required this.label,
  this.backButtonOfInsert = true,
  });




  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorScheme.onPrimary,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
      ),
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: backButtonOfInsert,
      title: Text(
        label,
        style: TextStylesOfPattern.bookingAppBarStyle,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
