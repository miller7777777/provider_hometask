import 'dart:math';
import 'dart:ui';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool selected = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SwitchProvider _state = Provider.of<SwitchProvider>(context);
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
                hoverColor: Colors.blue,
                value: selected,
                onChanged: null,
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

class SwitchProvider extends ChangeNotifier {
  bool _selected = false;
  bool get selectedValue => _selected;
  void _changeSwitch() {
    _selected = !_selected;
    notifyListeners();
  }
}
