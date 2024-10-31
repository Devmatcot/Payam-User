
class BankValidate {
    final String accountNumber;
    final String accountName;
    final String bankName;
    final String bankImage;

    BankValidate({
        required this.accountNumber,
        required this.accountName,
        required this.bankName,
        required this.bankImage,
    });

    factory BankValidate.fromJson(Map<String, dynamic> json) => BankValidate(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        bankName: json["bank_name"],
        bankImage: json["bank_image"],
    );

    Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
        "bank_name": bankName,
        "bank_image": bankImage,
    };
}
