
class UserModel {
    final String phoneNumber;
    final String firstName;
    final String lastName;
    final String email;
    final String gender;
    final DateTime dateOfBirth;
    final String balance;
    final String profilePhotoUrl;

    UserModel({
        required this.phoneNumber,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.gender,
        required this.dateOfBirth,
        required this.balance,
        required this.profilePhotoUrl,
    });

    UserModel copyWith({
        String? phoneNumber,
        String? firstName,
        String? lastName,
        String? email,
        String? gender,
        DateTime? dateOfBirth,
        String? balance,
        String? profilePhotoUrl,
    }) => 
        UserModel(
            phoneNumber: phoneNumber ?? this.phoneNumber,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            gender: gender ?? this.gender,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            balance: balance ?? this.balance,
            profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        phoneNumber: json["phone_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        balance: json["balance"],
        profilePhotoUrl: json["profile_photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "balance": balance,
        "profile_photo_url": profilePhotoUrl,
    };
}
