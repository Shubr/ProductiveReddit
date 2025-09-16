import 'package:http/http.dart' as http;
import './lib/Model/RedditModel.dart';
import 'dart:convert';

final redditPost = <String, int>{};

final url = Uri.https("oauth.reddit.com", "/api/v1/me");
final token = "ZusN7tpzZyrCSZyy4Y1Cybhf8Cav6A";

Future<void> fetchPost() async {
  var response = await http.get(
    url,
    headers: {"Authorization": "bearer $token", "User-Agent": "MyBot/0.0.1"},
  );
  print(response.body);
}

fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://www.reddit.com/r/androiddev/.json'),
  );
  return response.body;
}

// Future getAuth() async {
//   final uri = Uri.parse(
//     "https://www.reddit.com/api/v1/authorize"
//     "?client_id=$clientId"
//     "&response_type=code"
//     "&state=pro"
//     "&redirect_uri=$redirectUri"
//     "&duration=temporary"
//     "&scope=identity",
//   );

//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     throw 'Could not launch $uri';
//   }
// }

getPost() async {
  final uri = Uri.parse("https://www.reddit.com/r/androiddev/.json");
  var response = await http.get(uri);
  return parsePosts(response.body);
}

List<Post> parsePosts(String response) {
  final parsed =
      (jsonDecode(response) as List<Object?>).cast<Map<String, Object?>>();
  return parsed.map<Post>(Post.json).toList();
}

void main() async {
  // getPost();
  // fetchPost();
  print(fetchAlbum());
}
