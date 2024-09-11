import 'package:flutter/material.dart';
import 'package:travel_app/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Color(0xffd8ecf1),
        primaryColor: Color(0xff3ebace),
        scaffoldBackgroundColor: Color(0xfff3f5f7),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

