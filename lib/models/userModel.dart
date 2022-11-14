class UserModel {
  final int userId;
  final String name, email;

  UserModel({required this.userId, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
