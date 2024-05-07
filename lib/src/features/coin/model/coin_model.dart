class CoinModel {
  String id;
  int coins;
  double price;

  CoinModel({
    required this.id,
    required this.coins,
    required this.price,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json["id"],
        coins: json["coins"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coins": coins,
        "price": price,
      };
}
