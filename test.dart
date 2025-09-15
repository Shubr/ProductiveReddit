import 'package:http/http.dart' as http;

final redditPost = <String, int>{};

final clientId = "fGr67iNoLCmbN_9i9TD8gQ";
final redirectUri = "https://www.shub.website";
final secret = "pi53bv9ttGS89zYKpgQXzwsIR9S0Ow";

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
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
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
  print(response.body);
}

void main() async {
  getPost();
  // fetchPost();
}
