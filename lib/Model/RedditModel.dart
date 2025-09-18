class Reddit {
  String kind;
  // PostBody postBody;

  Reddit({required this.kind});

  factory Reddit.fromJson(Map<String, dynamic> json) {
    return Reddit(kind: json['kind']);
  }
}

class PostBody {
  Post post;

  PostBody({required this.post});

  factory PostBody.fromJson(Map<String, dynamic> json) {
    return PostBody(post: json['post']);
  }
}

class Post {
  String subreddit;
  String title;
  String postText;
  int epocTime;

  Post({
    required this.subreddit,
    required this.title,
    required this.postText,
    required this.epocTime,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      subreddit: json['subreddit'],
      title: json['title'],
      postText: json['selftext'],
      epocTime: json['created_utc'],
    );
  }
}
