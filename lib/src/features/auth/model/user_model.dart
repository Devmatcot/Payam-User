

class UserModel {
  String userId;
  String id;
  String firstName;
  String lastName;
  String email;
  String avatar;
  int coinsAvailable;
  String phoneNumber;

  UserModel({
    required this.userId,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.coinsAvailable,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? userId,
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? avatar,
    int? coinsAvailable,
    String? phoneNumber,
  }) =>
      UserModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        coinsAvailable: coinsAvailable ?? this.coinsAvailable,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        avatar: json["avatar"],
        coinsAvailable: json["coins_available"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "avatar": avatar,
        "coins_available": coinsAvailable,
        "phone_number": phoneNumber,
      };
}
