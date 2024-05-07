class AgentJobModel {
  final String id;
  final String title;
  final String address;
  final double budget;
  final int view;

  AgentJobModel({
    required this.id,
    required this.title,
    required this.address,
    required this.budget,
    required this.view,
  });

  AgentJobModel copyWith({
    String? id,
    String? title,
    String? address,
    double? budget,
    int? view
  }) =>
      AgentJobModel(
        id: id ?? this.id,
        title: title ?? this.title,
        address: address ?? this.address,
        budget: budget ?? this.budget,
        view: view ?? this.view
      );

  factory AgentJobModel.fromJson(Map<String, dynamic> json) => AgentJobModel(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        budget: json["budget"],
        view: json['views_count']
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "budget": budget,
      };
}
