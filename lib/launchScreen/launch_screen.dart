import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Define the fade-in animation
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start the animation
    _controller.forward();
  }

  Future<void> _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    // Simulate loading time
    await Future.delayed(const Duration(seconds: 3));

    if (_seen) {
      _navigateToMain();
    } else {
      await prefs.setBool('seen', true);
      _navigateToOnboarding();
    }
  }

  void _navigateToMain() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _navigateToOnboarding() {
    Navigator.of(context).pushReplacementNamed('/onboarding');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC300),
      body: Center(
        child: FadeTransition(
          opacity: _fadeInAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with a subtle scale animation
              ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.elasticOut,
                  ),
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 135,
                  height: 88.18,
                ),
              ),
              const SizedBox(height: 20),

              // Loading text with fade-in effect
              const Text(
                'MASTERPIECE - Vendor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Circular progress indicator for a professional touch
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
