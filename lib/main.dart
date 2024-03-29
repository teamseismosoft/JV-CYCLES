import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jv_cycles/pages/homePage.dart';
import 'package:jv_cycles/pages/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'J V CYCLES',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Login());
  }
}
