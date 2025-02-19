import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:examen_practic_sim/screens/home_screen.dart';
import 'package:examen_practic_sim/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final bool rememberMe = prefs.getBool('rememberMe') ?? false;
  final String? email = prefs.getString('email');
  final String? password = prefs.getString('password');

  runApp(MyApp(
    startScreen: (rememberMe && email != null && password != null) ? HomeScreen() : LoginScreen(),
  ));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Users App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: startScreen,
    );
  }
}
