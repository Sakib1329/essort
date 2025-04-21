
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widgets/timepickerpopup.dart';

class Aipage extends StatefulWidget {
  const Aipage({Key? key}) : super(key: key);

  @override
  State<Aipage> createState() => _VoiceAnimationUIState();
}

class _VoiceAnimationUIState extends State<Aipage> with TickerProviderStateMixin {
  bool _isActive = false;
  bool _iscontaineractive = false;

  final List<AnimationController> _rippleControllers = [];
  final List<Animation<double>> _rippleAnimations = [];

  static const int _numRipples = 5; // Increased number of ripples
  static const double _buttonSize = 120.0;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _numRipples; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2800), // Slower animation
      );

      final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(i * (1 / _numRipples), 1.0, curve: Curves.easeInOut),
        ),
      );

      _rippleControllers.add(controller);
      _rippleAnimations.add(animation);
    }
  }

  void _toggleActive() {
    setState(() {
      _isActive = !_isActive;
      _iscontaineractive = !_iscontaineractive;

      if (_isActive) {
        for (int i = 0; i < _rippleControllers.length; i++) {
          final controller = _rippleControllers[i];
          final delay = Duration(milliseconds: i * (2800 ~/ _numRipples));

          Future.delayed(delay, () {
            if (mounted && _isActive) {
              controller.repeat();
            }
          });
        }
      } else {
        for (var controller in _rippleControllers) {
          controller.reset();
        }
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _rippleControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
            ),
            const Text(
              'Back',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leadingWidth: 150,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              // Handle delete button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.auto_awesome, color: AppColors.primary, size: 20),
                SizedBox(width: 8),
                Text(
                  'I Am Here To Make Your Work Easier.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 400,
            height: 580,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ..._buildRippleCircles(),
                  GestureDetector(
                    onTap: _toggleActive,
                    child: Container(
                      width: _buttonSize,
                      height: _buttonSize,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isActive ? Icons.stop : Icons.mic_none,
                        color: Colors.black,
                        size: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (_iscontaineractive)
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildRippleCircles() {
    final List<Widget> ripples = [];

    for (int i = 0; i < _numRipples; i++) {
      ripples.add(
        AnimatedBuilder(
          animation: _rippleControllers[i],
          builder: (context, child) {
            final animationValue = _rippleAnimations[i].value;
            final scale = 0.5 + (animationValue * 2.0);
            final opacity = (1.0 - animationValue) * 0.7;

            return Opacity(
              opacity: _isActive ? opacity : 0.3,
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: _buttonSize + 30,
                  height: _buttonSize + 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    return ripples;
  }
}
