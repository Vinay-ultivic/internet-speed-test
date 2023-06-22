import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_speed_test/screens/welcome_screen.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen(),));
    });
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset("assets/images/speedtest.png", height: 100,color: Colors.white,),
          const Text("BY",style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.w900
          ),),
            Image.asset("assets/images/logo.png", height: 100,),

          ],),
      ),
      
      
    );
  }
}
