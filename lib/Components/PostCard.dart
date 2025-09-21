// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../ViewModel/sTheme.dart';

var theme = sTheme();

double height = 200.0;

Widget PostCard() {
  return (Container(
    width: 400,
    height: 200,
    decoration: BoxDecoration(
      color: Color.fromRGBO(23, 23, 23, 1),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(120, 205, 87, 1),
          spreadRadius: 0,
          offset: Offset(0, -20),
        ),
      ],
    ),
  ));
}

Widget postC(
  Color borderColor,
  String subreddit,
  String title,
  String postPreview,
  String post,
  String postDate,
) {
  return GestureDetector(
    onTap:
        () => {
          print(DateTime.fromMillisecondsSinceEpoch(1756661191*1000).runtimeType)
        },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SizedBox(height: height, width: theme.size.width),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "r/$subreddit",
                    style: TextStyle(
                      fontFamily: theme.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    postDate,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: theme.primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Color.fromRGBO(23, 23, 23, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: theme.primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(postPreview, style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
