// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timer_counter_app/Widget/Counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterDownApp(),
    
    );
  }
}
