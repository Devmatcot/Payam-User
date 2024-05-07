

class OptionModel {
  bool isTap;
  String name;
 
  OptionModel({
    required this.isTap,
    required this.name,
  });

  OptionModel copyWith({
    bool? isTap,
    String? name,
  }) {
    return OptionModel(
      isTap: isTap ?? this.isTap,
      name: name ?? this.name,
    );
  }


}
