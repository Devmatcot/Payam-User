class ChatModel {
  String id;
  String senderId;
  String senderProfileImage;
  String receiverId;
  String receiverProfileImage;
  String text;
  bool isRead;

  ChatModel({
    required this.id,
    required this.senderId,
    required this.senderProfileImage,
    required this.receiverId,
    required this.receiverProfileImage,
    required this.text,
    required this.isRead,
  });

  ChatModel copyWith({
    String? id,
    String? senderId,
    String? senderProfileImage,
    String? receiverId,
    String? receiverProfileImage,
    String? text,
    bool? isRead,
  }) =>
      ChatModel(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        senderProfileImage: senderProfileImage ?? this.senderProfileImage,
        receiverId: receiverId ?? this.receiverId,
        receiverProfileImage: receiverProfileImage ?? this.receiverProfileImage,
        text: text ?? this.text,
        isRead: isRead ?? this.isRead,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        senderId: json["sender_id"],
        senderProfileImage: json["sender_profile_image"],
        receiverId: json["receiver_id"],
        receiverProfileImage: json["receiver_profile_image"],
        text: json["text"],
        isRead: json["is_read"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sender_id": senderId,
        "sender_profile_image": senderProfileImage,
        "receiver_id": receiverId,
        "receiver_profile_image": receiverProfileImage,
        "text": text,
        "is_read": isRead,
      };
}







// class ChatModel {
//     String id;
//     String senderId;
//     String senderProfileImage;
//     String receiverId;
//     String receiverProfileImage;
//     ChatText text;
//     bool isRead;
//     String time12;
//     String time24;
//     int receiverUnread;

//     ChatModel({
//         required this.id,
//         required this.senderId,
//         required this.senderProfileImage,
//         required this.receiverId,
//         required this.receiverProfileImage,
//         required this.text,
//         required this.isRead,
//         required this.time12,
//         required this.time24,
//         required this.receiverUnread,
//     });

//     ChatModel copyWith({
//         String? id,
//         String? senderId,
//         String? senderProfileImage,
//         String? receiverId,
//         String? receiverProfileImage,
//         ChatText? text,
//         bool? isRead,
//         String? time12,
//         String? time24,
//         int? receiverUnread,
//     }) => 
//         ChatModel(
//             id: id ?? this.id,
//             senderId: senderId ?? this.senderId,
//             senderProfileImage: senderProfileImage ?? this.senderProfileImage,
//             receiverId: receiverId ?? this.receiverId,
//             receiverProfileImage: receiverProfileImage ?? this.receiverProfileImage,
//             text: text ?? this.text,
//             isRead: isRead ?? this.isRead,
//             time12: time12 ?? this.time12,
//             time24: time24 ?? this.time24,
//             receiverUnread: receiverUnread ?? this.receiverUnread,
//         );

//     factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
//         id: json["id"],
//         senderId: json["sender_id"],
//         senderProfileImage: json["sender_profile_image"],
//         receiverId: json["receiver_id"],
//         receiverProfileImage: json["receiver_profile_image"],
//         text: ChatText.fromJson(json["text"]),
//         isRead: json["is_read"],
//         time12: json["time12"],
//         time24: json["time24"],
//         receiverUnread: json["receiver_unread"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "sender_id": senderId,
//         "sender_profile_image": senderProfileImage,
//         "receiver_id": receiverId,
//         "receiver_profile_image": receiverProfileImage,
//         "text": text.toJson(),
//         "is_read": isRead,
//         "time12": time12,
//         "time24": time24,
//         "receiver_unread": receiverUnread,
//     };
// }

// class ChatText {
//     String text;

//     ChatText({
//         required this.text,
//     });

//     ChatText copyWith({
//         String? text,
//     }) => 
//         ChatText(
//             text: text ?? this.text,
//         );

//     factory ChatText.fromJson(Map<String, dynamic> json) => ChatText(
//         text: json["text"],
//     );

//     Map<String, dynamic> toJson() => {
//         "text": text,
//     };
// }

