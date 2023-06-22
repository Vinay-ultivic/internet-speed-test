import 'dart:async';

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:internet_speed_test/screens/result_screen.dart';
import '../main.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  double speed = 0;
  double downloadSpeed = 0;
  double uploadSpeed = 0;
  double uploadRate = 0.0;
  List<double> dataList = [];
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  /// method for testing download speed-------->
  Future<void> _testUploadSpeed() async {
    setBestServers();
    for (int i = 0; i <= 80; i++) {
      speed = i.toDouble();
    }
    final uploadRate = await tester.testUploadSpeed(servers: bestServersListt);
    setState(() {
      speed = uploadRate;
      downloadSpeed = speed;
      debugPrint("<----download speed---->$downloadSpeed");

      Timer(const Duration(seconds: 8), () {
        setState(() {});
        _testUploadSpeed2();
      });
    });
  }

  /// method for testing upload speed-------->
  Future<void> _testUploadSpeed2() async {
    speed = 0;
    setBestServers();
    for (int i = 0; i <= 80; i++) {
      speed = i.toDouble();
    }
    final uploadRate = await tester.testUploadSpeed(servers: bestServersListt);
    setState(() {
      speed = uploadRate;
      uploadSpeed = speed;
      debugPrint("<----upload speed---->$uploadSpeed");
      Timer(const Duration(seconds: 8), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                uploadSpeed: uploadSpeed,
                downloadSpeed: downloadSpeed,
              ),
            ));
      });
    });
  }

  @override
  void initState() {
    /// calling method for testing speed---->
    _testUploadSpeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title:
            Image.asset(
              "assets/images/speedtest.png",
              height: 100,
              color: Colors.white,
            )

          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Image.asset(
            "assets/images/logo.png",
            height: 100,
          ),
              CircularSeekBar(
                width: double.infinity,
                height: 250,
                progress: speed,
                interactive: false,
                barWidth: 18,
                startAngle: 45,
                sweepAngle: 270,
                strokeCap: StrokeCap.butt,
                progressGradientColors: const [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.indigo,
                  Colors.purple
                ],
                innerThumbRadius: 5,
                innerThumbStrokeWidth: 15,
                innerThumbColor: Colors.white,
                outerThumbRadius: 5,
                outerThumbStrokeWidth: 10,
                outerThumbColor: const Color.fromRGBO(206, 34, 40, 10),
                dashWidth: 4,
                dashGap: 2,
                animation: true,
                animDurationMillis: 5000,
                trackColor: Colors.white,
                curves: Curves.bounceIn,
                valueNotifier: _valueNotifier,
                child: Center(
                  child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${value.round()} ',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    'Mb/s',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                              Text('Speed',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                  )),
                            ],
                          )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //inverted selection button bar
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Material(
                      elevation: 19,
                      borderRadius: BorderRadius.circular(20),
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
                                _testUploadSpeed();
                              },
                              child: const Icon(Icons.download)),
                          ButtonBarEntry(
                              onTap: () {
                                setState(() {});
                                debugPrint('Second item tapped');
                                _testUploadSpeed();
                              },
                              child: const Icon(Icons.upload)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
