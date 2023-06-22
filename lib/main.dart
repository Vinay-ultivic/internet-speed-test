import 'package:flutter/material.dart';
import 'package:internet_speed_test/screens/splash_screen.dart';
import 'package:internet_speed_test/screens/welcome_screen.dart';
import 'package:speed_test_dart/classes/server.dart';
import 'package:speed_test_dart/speed_test_dart.dart';

void main() {
  setBestServers();
  runApp(const MyApp());
}

SpeedTestDart tester = SpeedTestDart();
List<Server> bestServersListt = [];

Future<void> setBestServers() async {
  final settings = await tester.getSettings();
  final servers = settings.servers;
  final bestServersList = await tester.getBestServers(
    servers: servers,
  );
  bestServersListt = bestServersList;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}
