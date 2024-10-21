class BankModel {
  final int id;
  final String name;
  final String image;
  final String bankCode;

  BankModel({
    required this.id,
    required this.name,
    required this.image,
    required this.bankCode,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        bankCode: json["bank_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "bank_code": bankCode,
      };
}
