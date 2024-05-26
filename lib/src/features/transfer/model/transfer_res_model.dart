
class TransferResponse {
    final String amount;
    final String fullName;
    final String transactionReference;

    TransferResponse({
        required this.amount,
        required this.fullName,
        required this.transactionReference,
    });

    factory TransferResponse.fromJson(Map<String, dynamic> json) => TransferResponse(
        amount: json["amount"],
        fullName: json["full_name"],
        transactionReference: json["transaction_reference"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "full_name": fullName,
        "transaction_reference": transactionReference,
    };
}
