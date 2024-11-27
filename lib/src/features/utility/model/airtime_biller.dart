
class AirtimeBiller {
    final int id;
    final String name;
    final dynamic logo;
    final String description;
    final String shortName;
    final String billerCode;
    final String countryCode;

    AirtimeBiller({
        required this.id,
        required this.name,
        required this.logo,
        required this.description,
        required this.shortName,
        required this.billerCode,
        required this.countryCode,
    });

    factory AirtimeBiller.fromJson(Map<String, dynamic> json) => AirtimeBiller(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        shortName: json["short_name"],
        billerCode: json["biller_code"],
        countryCode: json["country_code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "description": description,
        "short_name": shortName,
        "biller_code": billerCode,
        "country_code": countryCode,
    };
}
