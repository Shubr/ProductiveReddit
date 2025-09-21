class Reddit {
  PostBody postBody;

  Reddit({required this.postBody});

  factory Reddit.fromJson(Map<String, dynamic> json) {
    return Reddit(postBody: PostBody.fromJson(json['data']));
  }
}

class PostBody {
  List<Posts> post;
  PostBody({required this.post});

  factory PostBody.fromJson(Map<String, dynamic> json) {
    var list = json['children'] as List;
    var postList = list.map((i) => Posts.fromJson(i)).toList();
    return PostBody(post: postList);
  }
}

class Posts {
  PostDetails postDetails;

  Posts({required this.postDetails});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(postDetails: PostDetails.fromJson(json['data']));
  }
}

class PostDetails {
  String subreddit;
  String title;
  String postText;
  double epocTime;

  PostDetails({
    required this.subreddit,
    required this.title,
    required this.postText,
    required this.epocTime,
  });

  factory PostDetails.fromJson(Map<String, dynamic> json) {
    return PostDetails(
      subreddit: json['subreddit'],
      title: json['title'],
      postText: json['selftext'],
      epocTime: json['created_utc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subreddit": subreddit,
      "title": title,
      "postText": postText,
      "epocTime": DateTime.fromMillisecondsSinceEpoch(epocTime.toInt()),
    };
  }
}
