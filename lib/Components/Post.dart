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
  PostCard({
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
                        maxLines: height == 500.0 ? null: 2,
                        style: TextStyle(
                          height:0,
                          wordSpacing: 0,
                          letterSpacing: 0,

                          color: height == 500.0? theme.secondary : Colors.white,
                          fontFamily: theme.primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 10),

                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child:Text(
                          widget.post!,
                          maxLines: height == 500.0 ? null : 3,
                          style: TextStyle(height: 0,color: height == 500.0 ? Colors.white: theme.secondary, fontSize: height == 500.0 ? 15 : 10),
                        ),
                        ),
                      )
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
