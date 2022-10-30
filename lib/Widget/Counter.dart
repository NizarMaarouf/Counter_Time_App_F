// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  //
  int countdown = 7;
  //we must put the ? in the end of Timer .....
  Timer? downSeconds;

  startTimer() {
    downSeconds = Timer.periodic(Duration(seconds: 1), (test) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          // so we put ! here too
          // downSeconds!.cancel();
        }
      });
    });
  }

  rsetTimer() {
    setState(() {
      if (countdown >= 0 || countdown == '👌') {
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
            width: 500,
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
                  padding: countdown >= 0  ? EdgeInsets.all(14) :EdgeInsets.all(60),
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    countdown > 0 ? countdown.toString().padLeft(2, "0") : '👌',
                    style: TextStyle(
                    fontSize: countdown > 0 ?  50 : 40,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        minimumSize: Size(90, 35),
                        padding: EdgeInsets.symmetric(horizontal: 2),
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
                      width: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        minimumSize: Size(90, 35),
                        padding: EdgeInsets.symmetric(horizontal: 2),
                      ),
                      onPressed: () {
                        downSeconds!.cancel();
                      },
                      child: Text(
                        'Stop Timer',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        minimumSize: Size(90, 35),
                        padding: EdgeInsets.symmetric(horizontal: 2),
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
