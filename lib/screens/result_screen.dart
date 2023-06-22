import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_speed_test/screens/testing_screen.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class ResultScreen extends StatefulWidget {
  double downloadSpeed = 0;
  double uploadSpeed = 0;

  ResultScreen({Key? key,
    required this.uploadSpeed,
    required this.downloadSpeed
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}


class _ResultScreenState extends State<ResultScreen> {
  String uSpeed = "";
  String dSpeed = "";

  @override
  void initState() {
    dSpeed = widget.downloadSpeed.toStringAsFixed(2);
    uSpeed = widget.uploadSpeed.toStringAsFixed(2);
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
          title:             Image.asset("assets/images/speedtest.png", height: 100,color: Colors.white,),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(20)),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/logo.png", height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.download,
                                color: Color.fromRGBO(106, 255, 243, 20),
                              ),
                              SizedBox(width: 2,),
                              Text("DOWNLOAD",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.w900
                                ),),
                              SizedBox(width: 2,),
                              Text(
                                "Mbps", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          Text(dSpeed, style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: 40,
                              height: 1.3
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Icon(color: Color.fromRGBO(106, 255, 243, 20),
                                  Icons.upload),
                              SizedBox(width: 2,),
                              Text(
                                "UPLOAD", style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w900
                              ),),
                              SizedBox(width: 2,),
                              Text(
                                "Mbps", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          Text(uSpeed, style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: 40,
                              height: 1.3
                          ),),

                        ],
                      ),
                    ],
                  ),
                  Center(
                      child: Padding(
                        padding:  const EdgeInsets.only(
                            left: 18.0, right: 18.0),
                        child: Material(

                          elevation: 19,
                          borderRadius: BorderRadius.circular(21),
                          child: AnimatedButtonBar(
                            curve: Curves.easeOutBack,
                            radius: 20.0,
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromRGBO(206, 34, 40, 10),
                            invertedSelection: true,
                            children: [
                              ButtonBarEntry(
                                  onTap: () {
                                    setState(() {});
                                    debugPrint('First item tapped');
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TestingScreen(),));
                                //    _testUploadSpeed();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.speed),
                                      SizedBox(width: 3,),
                                      Text("Test Agin !",style: TextStyle(color: Colors.white),)
                                    ],
                                  )),

                            ],
                          ),
                        ),
                      ),

                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
