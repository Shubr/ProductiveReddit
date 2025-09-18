import 'package:http/http.dart' as https;

final d = {
  "page": 1,
  "per_page": 3,
  "total": 12,
  "total_pages": 4,
  "author": {"first_name": "Ms R", "last_name": "Reddy"},
  "data": [
    {
      "id": 1,
      "first_name": "George",
      "last_name": "Bluth",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg",
      "images": [
        {"id": 122, "imageName": "377cjsahdh388.jpeg"},
        {"id": 152, "imageName": "1743fsahdh388.jpeg"},
      ],
    },
    {
      "id": 2,
      "first_name": "Janet",
      "last_name": "Weaver",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg",
      "images": [
        {"id": 122, "imageName": "377cjsahdh380.jpeg"},
        {"id": 152, "imageName": "1743fsahdh388.jpeg"},
      ],
    },
    {
      "id": 3,
      "first_name": "Emma",
      "last_name": "Wong",
      "avatar":
          "https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg",
      "images": [
        {"id": 122, "imageName": "377cjsahdh388.jpeg"},
        {"id": 152, "imageName": "1743fsahdh388.jpeg"},
      ],
    },
  ],
};

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
  final uri = Uri.parse(
    "https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/refs/heads/master/assets/page.json",
  );
  final response = await https.get(uri);
  return response.body;
}

void main() async {
  var book = Books.fromJson(d);
  print(book.data[1].images[0].imageName);
}
