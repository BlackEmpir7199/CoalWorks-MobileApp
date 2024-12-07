class UserModel {
  final int userId;
  final String username;
  final String email;
  final String? phone;
  final String? profileImage;
  final bool isActive;
  final bool isSupervisor;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    this.phone,
    this.profileImage,
    required this.isActive,
    required this.isSupervisor,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      profileImage: json['profileImage'],
      isActive: json['isActive'],
      isSupervisor: json['isSupervisor'],
    );
  }
}