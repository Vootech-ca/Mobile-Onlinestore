class Item {
  final int id;
  final String itemName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Item(
      {required this.id,
      required this.itemName,
      required this.createdAt,
      required this.updatedAt});

  factory Item.fromJson(Map<String, dynamic> data) => Item(
      id: data["id"],
      itemName: data["item_name"],
      createdAt: DateTime.parse(data["created_at"]),
      updatedAt: DateTime.parse(data["updated_at"])
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'item_name': itemName,
        'created_at': createdAt,
        'updated_at': updatedAt
      };
}
