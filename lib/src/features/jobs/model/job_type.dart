class OptionsType {
  final String id;
  final String name;

  OptionsType({
    required this.id,
    required this.name,
  });

  factory OptionsType.fromJson(Map<String, dynamic> json) => OptionsType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
