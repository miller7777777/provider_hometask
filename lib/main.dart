import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Provider Hometask',
            style: TextStyle(
              color: getRandomColor(),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(),
              // AnimatedContainer(duration: duration),
              // Switch(value: , onChanged: onChanged),
            ],
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    // int alpha = getRandomNumber();
    int alpha = 255;
    int r = getRandomNumber();
    int g = getRandomNumber();
    int b = getRandomNumber();
    return Color.fromARGB(alpha, r, g, b);
  }

  int getRandomNumber() {
    Random random = new Random();
    return random.nextInt(256);
  }
}
