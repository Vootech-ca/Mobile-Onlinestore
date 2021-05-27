
class Category {
  final String id;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category(
      {required this.id,
      required this.categoryName,
      required this.createdAt,
      required this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> data) => Category(
      id: data["id"],
      categoryName: data["category_name"],
      createdAt: data["created_at"],
      updatedAt: data["updated_at"]);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'category_name': categoryName,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
