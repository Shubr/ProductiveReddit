import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditpro/Components/PostCard.dart';
import 'ViewModel/sTheme.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

var theme = sTheme();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Reddit Pro",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'InriaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 1,
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/profileIcon.svg',
              width: 40,
              height: 40,
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
      ),
      backgroundColor: const Color.fromRGBO(58, 58, 58, 1),
      body: Center(
        child: postC(
          theme.green,
          "Android",
          "Another text Feasko",
          "wdaaw",
          "dawdwadawdawdwadaw",
          "05/12/2025",
        ),
      ),
    );
  }
}
