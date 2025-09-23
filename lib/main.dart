import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditpro/Components/Post.dart';
import 'ViewModel/sTheme.dart';
import 'ViewModel/RedditViewModel.dart' as RedditResponse;
import 'Model/RedditModel.dart';
import 'dart:ui';

Reddit reddit = Reddit();
void main() async {
  reddit = await RedditResponse.getPosts("androiddev");

  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

var theme = sTheme();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Reddit> _redditPost;

  @override
  void initState() {
    super.initState();
    _redditPost = RedditResponse.getPosts("androiddev");
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            reddit.postBody?.post!.length ?? 0,
            (index) => ListTile(
              title: PostCard(subreddit: reddit.postBody?.post![index].postDetails!.subreddit,
                              borderColor: theme.green,
                              title: reddit.postBody?.post![index].postDetails!.title,
                              post: reddit.postBody?.post![index].postDetails!.postText,
                              postDate: reddit.postBody?.post![index].postDetails!.date              
              )
            ),
          ),
        ),
      ),
    );
  }
}
