import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat("dd-MM-yyyy");

class Reddit {
  final PostBody? postBody;

  Reddit({this.postBody});

  factory Reddit.fromJson(Map<String, dynamic> json) {
    return Reddit(postBody: PostBody.fromJson(json['data']));
  }
}

class PostBody {
  final List<Posts>? post;
  PostBody({this.post});

  factory PostBody.fromJson(Map<String, dynamic> json) {
    var list = json['children'] as List;
    var postList = list.map((i) => Posts.fromJson(i)).toList();
    return PostBody(post: postList);
  }
}

class Posts {
  final PostDetails? postDetails;

  Posts({this.postDetails});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(postDetails: PostDetails.fromJson(json['data']));
  }
}

class PostDetails {
  final String? subreddit;
  final String? title;
  final String? postText;
  final String? date;
  PostDetails({this.subreddit, this.title, this.postText, this.date});

  factory PostDetails.fromJson(Map<String, dynamic> json) {
    var epoc = json['created_utc'];
    DateTime toEpoctime = DateTime.fromMillisecondsSinceEpoch(
      epoc.floor() * 1000,
    );
    var formattedDate = formatter.format(toEpoctime);
    return PostDetails(
      subreddit: json['subreddit'],
      title: json['title'],
      postText: json['selftext'],
      date: formattedDate,
    );
  }
}
