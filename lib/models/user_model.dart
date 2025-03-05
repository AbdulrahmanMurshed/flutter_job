class UserModel {
  final String id;
  final String username;
  final String email;
  final String? cvUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.cvUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      cvUrl: data['cvUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'cvUrl': cvUrl,
    };
  }
}
