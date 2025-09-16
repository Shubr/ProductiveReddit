class JsonBody {
  DataBody data;
  JsonBody({required this.data});
}

class DataBody {
  List<Post> children;
  DataBody({required this.children});
}

class Post {
  String subreddit;
  String title;
  String textBody;

  Post({
    required this.subreddit,
    required this.title,
    required this.textBody,
  });

  factory Post.json(Map<String, dynamic> json) {
    return Post(
      subreddit: json['subreddit'] as String,
      title: json['title'] as String,
      textBody: json['post'] as String,
    );
  }
}
