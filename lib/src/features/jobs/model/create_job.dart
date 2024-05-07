class CreateJob {
  final String title;
  final String description;
  final String responsibilities;
  final String jobType;
  final String address;
  final String lga;
  final String state;
  final String zipCode;
  final double budget;
  final String duration;

  CreateJob({
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
  });

  CreateJob copyWith({
    String? title,
    String? description,
    String? responsibilities,
    String? jobType,
    String? address,
    String? lga,
    String? state,
    String? zipCode,
    double? budget,
    String? duration,
  }) =>
      CreateJob(
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
      );

  factory CreateJob.fromJson(Map<String, dynamic> json) => CreateJob(
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
      );

  Map<String, dynamic> toJson() => {
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
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class EditJob {
  final String id;
  final String owner;
  final String title;
  final String description;
  final String responsibilities;
  final String jobType;
  final String address;
  final String lga;
  final String state;
  final String zipCode;
  final double budget;
  final String duration;
  // final int viewsCount;
  final DateTime posted;

  EditJob({
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
    // required this.viewsCount,
    required this.posted,
  });

  factory EditJob.fromJson(Map<String, dynamic> json) => EditJob(
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
        // viewsCount: json["views_count"],
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
        // "views_count": viewsCount,
        "posted": posted.toIso8601String(),
      };
}
