import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redditpro/Components/Post.dart';
import 'package:redditpro/View/Home.dart';
import 'package:redditpro/View/Subreddit.dart';
import 'package:redditpro/ViewModel/RedditViewModel.dart';
import '/ViewModel/sTheme.dart';
import '/Model/RedditModel.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '/ViewModel/RedditViewModel.dart' as RedditResponse;

Reddit reddit = Reddit();

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Reddit? reddit;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPost();
  }

  Future<void> loadPost() async {
    final data = await RedditResponse.getPosts("androiddev");
    setState(() {
      reddit = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubredditPage()),
              );
            },
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
          children:
              List.generate(
                reddit?.postBody?.post!.length ?? 0,
                (index) => ListTile(
                  title: PostCard(
                    subreddit:
                        reddit?.postBody?.post![index].postDetails!.subreddit,
                    borderColor: theme.green,
                    title: reddit?.postBody?.post![index].postDetails!.title,
                    post: reddit?.postBody?.post![index].postDetails!.postText,
                    postDate: reddit?.postBody?.post![index].postDetails!.date,
                  ),
                ),
              ).reversed.toList(),
        ),
      ),
    );
  }
}
