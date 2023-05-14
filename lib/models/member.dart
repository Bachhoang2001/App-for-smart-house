class MemberModel {
  String name;

  MemberModel({required this.name});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}