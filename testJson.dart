import 'package:http/http.dart' as https;
import 'lib/Model/RedditModel.dart';
import 'dart:convert';

class Books {
  int page;
  int perPage;
  int total;
  int totalPages;
  Map<String, dynamic> author;
  List<Data> data;

  Books({
    required this.page,
    required this.total,
    required this.perPage,
    required this.totalPages,
    required this.author,
    required this.data,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();
    return Books(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      author: json['author'],
      data: dataList,
    );
  }
}

class Data {
  int id;
  String firstName;
  String lastName;
  String avatar;
  List<Images> images;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['images'] as List;
    List<Images> listImages = list.map((i) => Images.fromJson(i)).toList();
    return Data(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      images: listImages,
    );
  }
}

class Images {
  int id;
  String imageName;

  Images({required this.id, required this.imageName});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(id: json['id'], imageName: json['imageName']);
  }
}

getJson() async {
  final uri = Uri.parse("https://www.reddit.com/r/androiddev/.json");
  final response = await https.get(uri);
  return response.body;
}

void main() async {
  var decode = jsonDecode(await getJson());
  var post = Reddit.fromJson(decode);
  print(post.postBody?.post![0].postDetails?.date);
}
