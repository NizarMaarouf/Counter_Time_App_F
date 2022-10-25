// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int countdown = 7;

  startTimer() {
    Timer downSeconds = Timer.periodic(Duration(seconds: 1), (test) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          test.cancel();
        }
      });
    });
  }

  rsetTimer() {
    setState(() {
      if (countdown == 0) {
        countdown = 7;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            width: 300,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.yellow[800],
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  padding: EdgeInsets.all(9),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    countdown.toString().padLeft(2, "0"),
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Seconds',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onPressed: () {
                        startTimer();
                      },
                      child: Text(
                        'Start Timer',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        minimumSize: Size(88, 36),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onPressed: () {
                        rsetTimer();
                      },
                      child: Text(
                        'Reset Timer',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
