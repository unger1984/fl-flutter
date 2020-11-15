import 'package:mobile/src/models/Category.dart';

class Project {
  int id;
  int flId;
  String link;
  String title;
  DateTime date;
  String text;
  String price;
  int categoryId;
  Category category;
  DateTime createdAt;
  DateTime updatedAt;

  Project();

  Project.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? int.tryParse(json['id']) ?? null : null,
        flId = json['flId'] != null ? int.tryParse(json['flId']) ?? null : null,
        link = json['link'],
        title = json['title'],
        date = DateTime.tryParse(json['date']),
        text = json['text'],
        price = json['price'],
        categoryId = json['categoryId'] != null
            ? int.tryParse(json['categoryId']) ?? null
            : null,
        category = json.containsKey('category') && json['category'] != null
            ? Category.fromJson(json['category'])
            : null,
        createdAt = DateTime.tryParse(json['createdAt']),
        updatedAt = DateTime.tryParse(json['updatedAt']);

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'flId': flId.toString(),
        'link': link,
        'title': title,
        'date': date.toString(),
        'text': text,
        'price': price,
        'categoryId': categoryId.toString(),
        'category': category?.toJson() ?? null,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
      };
}
