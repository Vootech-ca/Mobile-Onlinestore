class Item {
  final int id;
  final String itemTitle;
  final String itemPrice;
  final String itemImage;
  final String itemDescription;
  final String itemCategoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Item(
      {required this.id,
      required this.itemTitle,
      required this.itemPrice,
      required this.itemImage,
      required this.itemDescription,
      required this.itemCategoryId,
      required this.createdAt,
      required this.updatedAt});

  factory Item.fromJson(Map<String, dynamic> data) => Item(
      id: data["id"],
      itemTitle: data["item_title"] ?? "NULL(Server Error)",
      itemPrice: data["item_price"] ?? "NULL(Server Error)",
      itemImage: data["item_image"] ?? "https://trirama.com/wp-content/uploads/2016/10/orionthemes-placeholder-image.png",
      itemDescription: data["item_description"] ?? "NULL(Server Error)",
      itemCategoryId: data["item_category_id"],
      createdAt: DateTime.parse(data["created_at"]),
      updatedAt: DateTime.parse(data["updated_at"]));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'item_title': itemTitle,
        'item_price': itemPrice,
        'item_image': itemImage,
        'item_description': itemDescription,
        'item_category_id': itemCategoryId,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
