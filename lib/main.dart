import 'package:flutter/material.dart';
import 'package:instagram_clone/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AuthScreen(),
      home: HomePage(),
      // theme: ThemeData(primarySwatch: white),
    );
  }
}
