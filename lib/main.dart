import 'package:flutter/material.dart';
import 'package:untitled3/screen1.dart';
import 'package:untitled3/screen3.dart';
import 'package:untitled3/screen4.dart';
import 'package:untitled3/screen5.dart';
import 'package:untitled3/screen6.dart';
import 'package:untitled3/screen7.dart';
import 'package:untitled3/screen8.dart';
import 'package:untitled3/screen9.dart';
import 'package:untitled3/uzair%20grid/grids.dart';

import 'screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: screen1()
    );
  }
}


