import '../Model/RedditModel.dart';
import 'package:http/http.dart' as http;

class RedditController {
  List<RedditPost> postList = [];

  getPost() async{
    final uri = Uri.parse("https://www.reddit.com/r/androiddev/.json");
    var response = await http.get(uri);
    print(response.body);
  }
  
}
