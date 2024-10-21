
class FundModel {
    final String authorizationUrl;
    final String accessCode;
    final String reference;

    FundModel({
        required this.authorizationUrl,
        required this.accessCode,
        required this.reference,
    });

    factory FundModel.fromJson(Map<String, dynamic> json) => FundModel(
        authorizationUrl: json["authorization_url"],
        accessCode: json["access_code"],
        reference: json["reference"],
    );

    Map<String, dynamic> toJson() => {
        "authorization_url": authorizationUrl,
        "access_code": accessCode,
        "reference": reference,
    };
}
