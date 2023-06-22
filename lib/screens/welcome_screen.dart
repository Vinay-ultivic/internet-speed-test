import 'package:flutter/material.dart';
import 'package:internet_speed_test/screens/testing_screen.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
          title:Image.asset("assets/images/speedtest.png", height: 100,color: Colors.white,),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RippleAnimation(
              color:const Color.fromRGBO(206, 34, 40, 10),
              delay: const Duration(milliseconds: 0),
              repeat: true,
              minRadius: 80,
              ripplesCount: 15,
              duration: const Duration(milliseconds: 6 * 300),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TestingScreen(),));
                },
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    minRadius: 76,
                    maxRadius: 76,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      minRadius: 75,
                      maxRadius: 75,
                      child: Text(
                        "Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
