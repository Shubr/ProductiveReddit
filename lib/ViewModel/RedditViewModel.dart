import '../Model/RedditModel.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

final baseUri = "https://www.reddit.com/r/";

Future<String> getRedditResponse(String subreddit) async {
  final uri = Uri.parse("$baseUri$subreddit/.json");
  final response = await https.get(uri);
  return response.body;
}

Map<String, dynamic> convertToJson(String data) {
  return jsonDecode(data);
}

Future<Reddit> getPosts(String subreddit) async {
  final response = await getRedditResponse(subreddit);
  final toJson = convertToJson(response);
  Reddit redditPosts = Reddit.fromJson(toJson);
  return redditPosts;
}
