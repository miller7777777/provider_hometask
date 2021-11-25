import 'dart:math';
import 'dart:ui';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(ChangeNotifierProvider<SwitchData>(
      create: (context) => SwitchData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  bool selected = true;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: 200.0,
                height: 200.0,
                // color: selected ? Colors.red : Colors.blue,
                color: getRandomColor(),
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                // child: const FlutterLogo(size: 75),
              ),
              Switch(
                value: context.watch<SwitchData>().getData,
                onChanged: (value) =>
                    context.read<SwitchData>().changeSwitch(value),
              ),
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

class SwitchData with ChangeNotifier {
  bool _data = false;

  bool get getData => _data;

  void changeSwitch(bool newBool) {
    _data = newBool;

    notifyListeners();
  }
}
