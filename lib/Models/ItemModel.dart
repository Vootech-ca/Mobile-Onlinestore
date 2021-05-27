class Item {
  final int id;
  final String itemTitle;
  final String itemPrice;
  final String itemDescription;
  final String itemCategoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Item(
      {required this.id,
      required this.itemTitle,
      required this.itemPrice,
      required this.itemDescription,
      required this.itemCategoryId,
      required this.createdAt,
      required this.updatedAt});

  factory Item.fromJson(Map<String, dynamic> data) => Item(
      id: data["id"],
      itemTitle: data["item_title"],
      itemPrice: data["item_price"],
      itemDescription: data["item_description"],
      itemCategoryId: data["item_category_id"],
      createdAt: DateTime.parse(data["created_at"]),
      updatedAt: DateTime.parse(data["updated_at"]));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'item_title': itemTitle,
        'item_price': itemPrice,
        'item_description': itemDescription,
        'item_category_id': itemCategoryId,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
