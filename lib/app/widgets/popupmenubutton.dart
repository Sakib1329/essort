import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskPopupMenu extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onNotify;
  final void Function()? onDelete;
  final bool ismoriz;

  const TaskPopupMenu({
    super.key,
    required this.ismoriz,
    this.onEdit,
    this.onNotify,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
          ismoriz==true
          ?Icons.more_horiz
          :Icons.more_vert,
          color: Colors.white),
      color: AppColors.darkBackground,

      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: (value) {
        if (value == 0) onEdit?.call();
        if (value == 1) onNotify?.call();
        if (value == 2) onDelete?.call();
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/delete.svg',
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Center(
            child: SvgPicture.asset(
              ismoriz==true
              ?'assets/icons/reminder.svg'
              :'assets/icons/rename.svg',
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/edit2.svg',
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
