import "package:flutter/material.dart";
import "package:foodapp/Pages/StartPage/UI/startpage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
