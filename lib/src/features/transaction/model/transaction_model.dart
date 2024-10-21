class TransactionHistoryModel {
  final int id;
  final String type;
  final String amount;
  final String status;
  final String reference;
  final String? narration;
  final int userId;
  final DateTime createdAt;
  final Receiver receiver;

  TransactionHistoryModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.status,
    required this.reference,
    required this.narration,
    required this.userId,
    required this.createdAt,
    required this.receiver,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      TransactionHistoryModel(
        id: json["id"],
        type: json["type"],
        amount: json["amount"],
        status: json["status"],
        reference: json["reference"],
        narration: json["narration"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        receiver: Receiver.fromJson(json["receiver"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "amount": amount,
        "status": status,
        "reference": reference,
        "narration": narration,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "receiver": receiver.toJson(),
      };
}

class Receiver {
  final int id;
  final String name;

  Receiver({
    required this.id,
    required this.name,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
