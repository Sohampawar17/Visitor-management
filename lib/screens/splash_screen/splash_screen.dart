import 'package:flutter/material.dart';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../router.router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLoggedIn = false;

  Future<void> _performAsyncOperations() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.getString("api_secret") != null &&
        prefs.getString("api_key") != null) {
      isLoggedIn = true;
    }
    await Future.delayed(const Duration(seconds: 3));
  }

  double opacity = 1.0; // Initial opacity for fade-out animation

  @override
  void initState() {
    super.initState();
    _performAsyncOperations().then((_) {
      if (isLoggedIn) {
        Navigator.popAndPushNamed(context, Routes.homePage);
      } else {
        Navigator.popAndPushNamed(context, Routes.loginViewScreen);
      }
    });

    // Start the fade-out animation after 2 seconds (adjust timing as needed)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/295/295128.png')),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 3),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Venkateshwara Power Project',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
