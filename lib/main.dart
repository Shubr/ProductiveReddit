import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditpro/Model/RedditModel.dart';
import 'package:redditpro/View/Home.dart';
import 'package:redditpro/View/Subreddit.dart';
import 'ViewModel/sTheme.dart';

Reddit reddit = Reddit();

void main() async {
  // reddit = await RedditResponse.getPosts("androiddev");
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
    return SubredditPage();
  }
}
