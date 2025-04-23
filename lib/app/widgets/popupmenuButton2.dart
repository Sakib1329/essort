import 'package:essort/app/modules/home/views/Categorydescription.dart';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LongPressPopupMenu extends StatelessWidget {
  final Widget child;
  final void Function()? onRename;
  final void Function()? onDelete;

  const LongPressPopupMenu({
    super.key,
    required this.child,
    this.onRename,
    this.onDelete,
  });

  void _showPopupMenu(BuildContext context, Offset position) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      color: AppColors.darkBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      position: RelativeRect.fromRect(
        Rect.fromLTWH(position.dx, position.dy, 0, 0),
        Offset.zero & overlay.size,
      ),
      items: [
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
              'assets/icons/rename.svg',
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ).then((value) {
      if (value == 0) onDelete?.call();
      if (value == 1) onRename?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(Categorydescription(),transition: Transition.rightToLeft);
      },
      onLongPressStart: (details) {
        _showPopupMenu(context, details.globalPosition);
      },
      child: child,
    );
  }
}
