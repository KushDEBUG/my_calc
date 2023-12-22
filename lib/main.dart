import 'package:flutter/material.dart';
import 'package:my_calc/Views/Home_view.dart';

void main() {
  runApp(const MyCalc());
}

class MyCalc extends StatelessWidget {
  const MyCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
