class BeneficiaryModel {
  final int id;
  final String accountName;
  final String accountNumber;
  final String bankName;
  final dynamic profilePhotoPath;
  final DateTime createdAt;

  BeneficiaryModel({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    required this.profilePhotoPath,
    required this.createdAt,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      BeneficiaryModel(
        id: json["id"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        bankName: json["bank_name"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_name": accountName,
        "account_number": accountNumber,
        "bank_name": bankName,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt.toIso8601String(),
      };
}
