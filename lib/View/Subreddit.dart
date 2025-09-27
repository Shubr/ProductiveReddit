import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redditpro/Components/Post.dart';
import 'package:redditpro/View/Home.dart';

class SubredditPage extends StatefulWidget {
  const SubredditPage({super.key});

  @override
  State<SubredditPage> createState() => _SubredditPageState();
}

class _SubredditPageState extends State<SubredditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme:IconThemeData(color: Colors.white),
        title: Text(
          "Subreddits",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'InriaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
      ),
      backgroundColor: const Color.fromRGBO(58, 58, 58, 1),
      body: SubredditCard(),
    );
  }
}
