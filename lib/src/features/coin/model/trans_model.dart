class TransactionModel {
  String id;
  String title;
  int coin;
  double price;
  DateTime created;

  TransactionModel({
    required this.id,
    required this.title,
    required this.coin,
    required this.price,
    required this.created,
  });

  TransactionModel copyWith({
    String? id,
    String? title,
    int? coin,
    double? price,
    DateTime? date,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        title: title ?? this.title,
        coin: coin ?? this.coin,
        price: price ?? this.price,
        created: date??this.created
      );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        title: json["title"],
        coin: json["coin"],
        price: json["price"],
        created:DateTime.parse(json["created"])
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coin": coin,
        "price": price,
      };
}
