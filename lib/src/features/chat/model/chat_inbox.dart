

class ChatInbox {
    List<InboxList> inboxList;
    List<Message> messages;

    ChatInbox({
        required this.inboxList,
        required this.messages,
    });

    ChatInbox copyWith({
        List<InboxList>? inboxList,
        List<Message>? messages,
    }) => 
        ChatInbox(
            inboxList: inboxList ?? this.inboxList,
            messages: messages ?? this.messages,
        );

    factory ChatInbox.fromJson(Map<String, dynamic> json) => ChatInbox(
        inboxList: List<InboxList>.from(json["inbox_list"].map((x) => InboxList.fromJson(x))),
        messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "inbox_list": List<dynamic>.from(inboxList.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    };
}

class InboxList {
    String id;
    String receiverId;
    String receiverName;
    String receiverProfileImage;
    String lastMessage;
    DateTime time;

    InboxList({
        required this.id,
        required this.receiverId,
        required this.receiverName,
        required this.receiverProfileImage,
        required this.lastMessage,
        required this.time,
    });

    InboxList copyWith({
        String? id,
        String? receiverId,
        String? receiverName,
        String? receiverProfileImage,
        String? lastMessage,
        DateTime? time,
    }) => 
        InboxList(
            id: id ?? this.id,
            receiverId: receiverId ?? this.receiverId,
            receiverName: receiverName ?? this.receiverName,
            receiverProfileImage: receiverProfileImage ?? this.receiverProfileImage,
            lastMessage: lastMessage ?? this.lastMessage,
            time: time ?? this.time,
        );

    factory InboxList.fromJson(Map<String, dynamic> json) => InboxList(
        id: json["id"],
        receiverId: json["receiver_id"],
        receiverName: json["receiver_name"],
        receiverProfileImage: json["receiver_profile_image"],
        lastMessage: json["last_message"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "receiver_id": receiverId,
        "receiver_name": receiverName,
        "receiver_profile_image": receiverProfileImage,
        "last_message": lastMessage,
        "time": time.toIso8601String(),
    };
}

class Message {
    String id;
    String text;
    bool isRead;

    Message({
        required this.id,
        required this.text,
        required this.isRead,
    });

    Message copyWith({
        String? id,
        String? text,
        bool? isRead,
    }) => 
        Message(
            id: id ?? this.id,
            text: text ?? this.text,
            isRead: isRead ?? this.isRead,
        );

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        text: json["text"],
        isRead: json["is_read"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "is_read": isRead,
    };
}
