import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionOptionTile extends StatelessWidget {
  final int value;
  final int groupValue;
  final void Function(int?) onChanged;
  final String title;
  final String subtitle;
  final bool istrue;

  const SubscriptionOptionTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.istrue,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return Column(
      children: [
        ListTile(
          onTap: () => onChanged(value),
          leading: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2),
              color: isSelected ? AppColors.white : Colors.transparent,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.black, size: 16)
                : null,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 20)),
                  Text(subtitle, style: const TextStyle(color: Color(0x88FFFFFF))),
                ],

              ),
SizedBox(width: 70,),
              if (istrue)
                Container(
                  width:120,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'BEST VALUE',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),

      ],
    );
  }
}
