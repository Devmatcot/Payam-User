
class TransactionHistoryModel {
    final int id;
    final User fromUser;
    final User toUser;
    final String amount;
    final String? narration;
    final String transactionType;
    final String status;
    final String transactionReference;
    // final dynamic deletedAt;
    final DateTime createdAt;
    final DateTime updatedAt;

    TransactionHistoryModel({
        required this.id,
        required this.fromUser,
        required this.toUser,
        required this.amount,
        required this.narration,
        required this.transactionType,
        required this.status,
        required this.transactionReference,
        // required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => TransactionHistoryModel(
        id: json["id"],
        fromUser: User.fromJson(json["from_user"]),
        toUser: User.fromJson(json["to_user"]),
        amount: json["amount"],
        narration: json["narration"],
        transactionType: json["transaction_type"],
        status: json["status"],
        transactionReference: json["transaction_reference"],
        // deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "from_user": fromUser.toJson(),
        "to_user": toUser.toJson(),
        "amount": amount,
        "narration": narration,
        "transaction_type": transactionType,
        "status": status,
        "transaction_reference": transactionReference,
        // "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class User {
    final int id;
    final String firstName;
    final String lastName;
    final String phoneNumber;
    final String profilePhotoUrl;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.profilePhotoUrl,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        profilePhotoUrl: json["profile_photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "profile_photo_url": profilePhotoUrl,
    };
}
