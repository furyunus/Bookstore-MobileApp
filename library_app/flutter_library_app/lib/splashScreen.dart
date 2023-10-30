import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'LoginPage.dart';
import 'context_extension.dart';

class splashScreen extends StatefulWidget {
    const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {

    double imageHeight = context.dynamicHeight(0.9);
    double imageWidth = context.dynamicWidth(0.9);

    return  Center(
      child: Scaffold(
        body: AnimatedSplashScreen(
        splash: Image.asset('images/book.png',height: imageHeight,width: imageWidth,) , 
        nextScreen: loginPage(),
        duration: 3500 ),
      ),
    );
  }
}