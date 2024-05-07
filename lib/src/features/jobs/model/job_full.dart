class JobFullDetails {
  final String id;
  final String owner;
  final String title;
  final String description;
  final dynamic responsibilities;
  final dynamic jobType;
  final String address;
  final dynamic lga;
  final dynamic state;
  final dynamic zipCode;
  final double budget;
  final dynamic duration;
  final int viewsCount;
  final DateTime posted;

  JobFullDetails({
    required this.id,
    required this.owner,
    required this.title,
    required this.description,
    required this.responsibilities,
    required this.jobType,
    required this.address,
    required this.lga,
    required this.state,
    required this.zipCode,
    required this.budget,
    required this.duration,
    required this.viewsCount,
    required this.posted,
  });

  JobFullDetails copyWith({
    String? id,
    String? owner,
    String? title,
    String? description,
    dynamic responsibilities,
    dynamic jobType,
    String? address,
    dynamic lga,
    dynamic state,
    dynamic zipCode,
    double? budget,
    dynamic duration,
    int? viewsCount,
    DateTime? posted,
  }) =>
      JobFullDetails(
        id: id ?? this.id,
        owner: owner ?? this.owner,
        title: title ?? this.title,
        description: description ?? this.description,
        responsibilities: responsibilities ?? this.responsibilities,
        jobType: jobType ?? this.jobType,
        address: address ?? this.address,
        lga: lga ?? this.lga,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        budget: budget ?? this.budget,
        duration: duration ?? this.duration,
        viewsCount: viewsCount ?? this.viewsCount,
        posted: posted ?? this.posted,
      );

  factory JobFullDetails.fromJson(Map<String, dynamic> json) => JobFullDetails(
        id: json["id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        responsibilities: json["responsibilities"],
        jobType: json["job_type"],
        address: json["address"],
        lga: json["lga"],
        state: json["state"],
        zipCode: json["zip_code"],
        budget: json["budget"],
        duration: json["duration"],
        viewsCount: json["views_count"],
        posted: DateTime.parse(json["posted"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "title": title,
        "description": description,
        "responsibilities": responsibilities,
        "job_type": jobType,
        "address": address,
        "lga": lga,
        "state": state,
        "zip_code": zipCode,
        "budget": budget,
        "duration": duration,
        "views_count": viewsCount,
        "posted": posted.toIso8601String(),
      };
}
