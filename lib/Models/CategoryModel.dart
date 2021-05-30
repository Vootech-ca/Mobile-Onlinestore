class Category {
  final int id;
  final String categoryName;
  final String categoryImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category(
      {required this.id,
      required this.categoryName,
      required this.categoryImage,
      required this.createdAt,
      required this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> data) => Category(
      id: data["id"] ?? 0,
      categoryName: data["category_name"] ?? "NULL(Server Error)",
      categoryImage: data["category_image"] ?? "https://trirama.com/wp-content/uploads/2016/10/orionthemes-placeholder-image.png",
      createdAt: DateTime.parse(data["created_at"]) ,
      updatedAt: DateTime.parse(data["updated_at"])
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'category_name': categoryName,
        'category_image': categoryImage,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
