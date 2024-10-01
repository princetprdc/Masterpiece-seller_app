import 'package:flutter/material.dart';
import 'package:seller_app/authScreens/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to MASTERPIECE",
      "description":
          "Connecting Builders, Vendors, and Professionals Seamlessly.",
      "image": "assets/images/s1.png",
    },
    {
      "title": "Find Vendors",
      "description":
          "Easily find and connect with trusted vendors for all your building material needs.",
      "image": "assets/images/s2.png",
    },
    {
      "title": "Hire Professionals",
      "description":
          "Hire skilled workers and contractors for your building projects.",
      "image": "assets/images/s3.png",
    },
    {
      "title": "Track Deliveries",
      "description": "Keep track of your orders and deliveries with ease.",
      "image": "assets/images/s4.png",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget _buildPageContent(Map<String, String> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(data['image']!, height: 300.0),
        const SizedBox(height: 20.0),
        Text(
          data['title']!,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data['description']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboardingData.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: _currentPage == index ? 12.0 : 8.0,
          height: _currentPage == index ? 12.0 : 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? const Color(0xFF333333)
                : const Color(0xFFC4C4C4),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: onboardingData.length,
            itemBuilder: (context, index) =>
                _buildPageContent(onboardingData[index]),
          ),
          Positioned(
            top: 40.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
                // Navigate to login screen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SigninScreen()),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _currentPage == 0
                        ? const SizedBox.shrink()
                        : TextButton(
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: const Text(
                              "Prev",
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                    _currentPage == onboardingData.length - 1
                        ? ElevatedButton(
                            onPressed: () {
                              // Navigate to login screen
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SigninScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFC300),
                            ),
                            child: const Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFC300),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}