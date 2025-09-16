import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as https;

var simpleMap = {"id": "487349", "name": "Pooja Bhaumik", "score": 1000};
var simpleStructureArray = {
  "city": "Mumbai",
  "streets": ["address1", "address2"],
};
var simpleNestedStructure = {
  "shape_name": "rectangle",
  "property": {"width": 5.0, "breadth": 10.0},
};

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
        {"id": 122, "imageName": "377cjsahdh388.jpeg"},
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

class Student {
  String studentId;
  String studentName;
  int studentScore;

  Student({
    required this.studentId,
    required this.studentName,
    required this.studentScore,
  });

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
      studentId: parsedJson['id'],
      studentName: parsedJson['name'],
      studentScore: parsedJson['score'],
    );
  }
}

class Location {
  String city;
  List<String> streets;

  Location({required this.city, required this.streets});

  factory Location.fromJson(Map<String, dynamic> parseJson) {
    return Location(city: parseJson['city'], streets: parseJson['streets']);
  }
}

class Shape {
  String shapeName;
  Property property;
  // Map<String, dynamic> property;

  Shape({required this.shapeName, required this.property});

  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(
      shapeName: json['shape_name'],
      property: Property.fromJson(json['property']),
    );
  }
}

class Property {
  double width;
  double breadth;

  Property({required this.width, required this.breadth});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(width: json['width'], breadth: json['breadth']);
  }
}

getJson() async {
  final uri = Uri.parse(
    "https://raw.githubusercontent.com/PoojaB26/ParsingJSON-Flutter/refs/heads/master/assets/page.json",
  );
  final response = await https.get(uri);
  return response.body;
}

class Book {
  int page;
  int perPage;
  int total;
  Map<String, dynamic> author;
  Data data;

  Book({
    required this.page,
    required this.perPage,
    required this.total,
    required this.author,
    required this.data,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var list = json['data'];
    return Book(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      author: json['author'],
      data: list.map((i)=>Data.fromJson(i)).toList(),
    );
  }
}

class Data {
  int id;
  String firstName;
  String lastName;
  String avatar;
  Images image;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      image: Images.fromJson(json['images']),
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

void main() async {
  // Student students = new Student.fromJson(simpleMap);
  // Location locations = new Location.fromJson(simpleStructureArray);
  // Shape shapes = new Shape.fromJson(simpleNestedStructure);
  // print(students.studentId);
  // print(locations.streets);
  // print(shapes.property.width);
  // final json = await getJson();
  Book books = new Book.fromJson(d);
}
