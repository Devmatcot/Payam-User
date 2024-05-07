

class JobModel {
    final String id;
    final String owner;
    final String title;
    final String address;
    final double budget;
    final int viewsCount;

    JobModel({
        required this.id,
        required this.owner,
        required this.title,
        required this.address,
        required this.budget,
        required this.viewsCount,
    });

    JobModel copyWith({
        String? id,
        String? owner,
        String? title,
        String? address,
        double? budget,
        int? viewsCount,
    }) => 
        JobModel(
            id: id ?? this.id,
            owner: owner ?? this.owner,
            title: title ?? this.title,
            address: address ?? this.address,
            budget: budget ?? this.budget,
            viewsCount: viewsCount ?? this.viewsCount,
        );

    factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"],
        owner: json["owner"],
        title: json["title"],
        address: json["address"],
        budget: json["budget"],
        viewsCount: json["views_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "title": title,
        "address": address,
        "budget": budget,
        "views_count": viewsCount,
    };
    
}
