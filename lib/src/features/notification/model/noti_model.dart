

class NotificationModel {
    final String id;
    final String title;
    final String body;
    final DateTime created;
    final bool isRead;

    NotificationModel({
        required this.id,
        required this.title,
        required this.body,
        required this.created,
        required this.isRead,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        created: DateTime.parse(json["created"]),
        isRead: json["is_read"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "created": created.toIso8601String(),
        "is_read": isRead,
    };
}
