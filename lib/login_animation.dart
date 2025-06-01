import 'package:flutter/material.dart';
import 'package:stream_application_1/home_screen_page.dart'; // Update this to your correct path

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({super.key});

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation>
    with TickerProviderStateMixin {
  late AnimationController _upwardController;
  late Animation<Offset> _upwardAnimation;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Slide up animation controller
    _upwardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _upwardAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _upwardController, curve: Curves.bounceOut),
    );

    // Zoom scale animation controller
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 20.0,
    ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeIn));

    // Start upward animation after a short delay (for smoother start on mobile)
    // Future.delayed(Duration(milliseconds: 300), () {
      _upwardController.forward();
    // });

    // Start scale after upward animation completes
    _upwardController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleController.forward();
      }
    });

    // Navigate to HomeScreen after scale completes
    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _upwardController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // or your desired background
      body: Center(
        child: SlideTransition(
          position: _upwardAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Change to your app's branding color
              ),
              child: Center(
                child: Text(
                  'V', // Example text/logo
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 170,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
