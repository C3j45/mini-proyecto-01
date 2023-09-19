import 'package:flutter/material.dart';
import 'package:proyect1/src/splash_screen.dart';

void main() => runApp(CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      home: SplashScreen(),
    );
  }
}
