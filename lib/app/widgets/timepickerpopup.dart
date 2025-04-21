import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../theme/colors.dart';

class QuickReminderPopup {
  static void show(BuildContext context, {String title = 'Set Reminder'}) {
    showDialog(
      context: context,
      builder: (_) => _ReminderDialog(title: title),
    );
  }
}

class _ReminderDialog extends StatefulWidget {
  final String title;

  const _ReminderDialog({required this.title});

  @override
  State<_ReminderDialog> createState() => _ReminderDialogState();
}

class _ReminderDialogState extends State<_ReminderDialog> {
  late int hour;
  late int minute;
  late bool isAM;

  @override
  void initState() {
    super.initState();
    final now = TimeOfDay.now();
    hour = now.hourOfPeriod == 0 ? 12 : now.hourOfPeriod;
    minute = now.minute;
    isAM = now.period == DayPeriod.am;
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d, MMMM').format(DateTime.now());

    return Dialog(
      backgroundColor: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateTime.now().year}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white, fontSize: 20,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/alarm.svg',
                      height: 30,
                      width: 40,
                      colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    Center(
                      child: Text('Type in time', style: TextStyle(color: AppColors.white)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTimeColumn(true),
                        const SizedBox(width: 8),
                        const Text(":", style: TextStyle(color: Colors.white, fontSize: 40)),
                        const SizedBox(width: 8),
                        _buildTimeColumn(false),
                        const SizedBox(width: 12),
                        _buildAmPmToggle(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.grey),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final selectedHour = isAM
                              ? (hour == 12 ? 0 : hour)
                              : (hour == 12 ? 12 : hour + 12);
                          final selectedTime = TimeOfDay(hour: selectedHour, minute: minute);
                          // Use selectedTime if needed
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                        child: const Text('Done', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(
                'assets/icons/close.svg', // Make sure this file exists
                height: 30,
                width: 30,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeColumn(bool isHour) {
    int value = isHour ? hour : minute;
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
          onPressed: () {
            setState(() {
              if (isHour) {
                hour = hour < 12 ? hour + 1 : 1;
              } else {
                minute = (minute + 1) % 60;
              }
            });
          },
        ),
        Text(
          value.toString().padLeft(2, '0'),
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () {
            setState(() {
              if (isHour) {
                hour = hour > 1 ? hour - 1 : 12;
              } else {
                minute = (minute - 1 + 60) % 60;
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildAmPmToggle() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isAM = true),
          child: Text(
            'AM',
            style: TextStyle(
              color: isAM ? AppColors.primary : AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => isAM = false),
          child: Text(
            'PM',
            style: TextStyle(
              color: !isAM ? AppColors.primary : AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
