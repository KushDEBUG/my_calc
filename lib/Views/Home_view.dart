import 'package:flutter/material.dart';
import 'package:my_calc/Views/Calculator_View.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child:  CalculatorViews(),
      ),
    );
  }
}
