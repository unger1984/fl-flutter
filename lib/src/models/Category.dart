class Category {
  int id;
  String title;
  int parentId;
  Category parent;
  List<Category> child;

  Category();

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? int.tryParse(json['id']) ?? null : null,
        title = json['title'],
        parentId = json['parentId'] != null
            ? int.tryParse(json['parentId']) ?? null
            : null,
        parent = json.containsKey('parent') && json['parent'] != null
            ? Category.fromJson(json['parent'])
            : null,
        child = json.containsKey('child') && json['child'] != null
            ? (json['child'] as List)
                .map((item) => Category.fromJson(item))
                .toList()
            : new List<Category>();

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'title': title,
        'parentId': parentId.toString(),
        'parent': parent?.toJson() ?? null,
        'child': child,
      };
}
