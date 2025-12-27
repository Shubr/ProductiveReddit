// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../ViewModel/sTheme.dart';
import 'package:intl/intl.dart';

var theme = sTheme();
var date = DateTime.fromMillisecondsSinceEpoch(1756661191 * 1000);
final DateFormat formatter = DateFormat('dd-MM-yyyy');

class PostCard extends StatefulWidget {
  final Color? borderColor;
  final String? subreddit;
  final String? title;
  final String? post;
  final String? postDate;
  const PostCard({
    super.key,
    this.borderColor,
    this.subreddit,
    this.title,
    this.post,
    this.postDate,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  double height = 200.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => {
            setState(() {
              height == 200.0 ? height = 500.0 : height = 200.0;
            }),
          },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                    color: widget.borderColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "r/${widget.subreddit}",
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
                      widget.postDate!,
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title!,
                        maxLines: height == 500.0 ? null : 2,
                        style: TextStyle(
                          height: 0,
                          wordSpacing: 0,
                          letterSpacing: 0,

                          color:
                              height == 500.0 ? theme.secondary : Colors.white,
                          fontFamily: theme.primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),

                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.post!,
                            maxLines: height == 500.0 ? null : 3,
                            style: TextStyle(
                              height: 0,
                              color:
                                  height == 500.0
                                      ? Colors.white
                                      : theme.secondary,
                              fontSize: height == 500.0 ? 15 : 10,
                            ),
                          ),
                        ),
                      ),
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
}

class SubredditCard extends StatefulWidget {
  const SubredditCard({super.key});

  @override
  State<SubredditCard> createState() => _SubredditCardState();
}

class _SubredditCardState extends State<SubredditCard> {
  double height = 400;
  Color selectedColor = theme.green;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        children: [
          SizedBox(height: height, width: theme.size.width),
          Container(
            width: theme.size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedColor,
            ),
          ),
          Positioned(
            top: 6,
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      "r/Androiddev",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: theme.primaryFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (height == 400)
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 35,
                        right: 35,
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Post Per Day",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: theme.primaryFont,
                                ),
                              ),
                              Text(
                                "Maximum: 10",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: theme.secondary,
                                  fontSize: 12,
                                  fontFamily: theme.primaryFont,
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(68, 68, 68, 1),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Color",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: theme.primaryFont,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.green)
                                        {
                                          setState(() {
                                            selectedColor = theme.green;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.green)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/green.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.purple)
                                        {
                                          setState(() {
                                            selectedColor = theme.purple;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.purple)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/purple.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.red)
                                        {
                                          setState(() {
                                            selectedColor = theme.red;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.red)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/red.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.blue)
                                        {
                                          setState(() {
                                            selectedColor = theme.blue;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.blue)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/blue.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.yellow)
                                        {
                                          setState(() {
                                            selectedColor = theme.yellow;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.yellow)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/yellow.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.orange)
                                        {
                                          setState(() {
                                            selectedColor = theme.orange;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.orange)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/orange.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => {
                                      if (selectedColor != theme.pink)
                                        {
                                          setState(() {
                                            selectedColor = theme.pink;
                                          }),
                                        },
                                    },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 2,
                                      color: (selectedColor == theme.pink)? Colors.white : theme.border
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/img/pink.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween
                            ,children: [
                            iButton("Close", theme.red),
                            iButton("Done", theme.green)
                          ],)
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
