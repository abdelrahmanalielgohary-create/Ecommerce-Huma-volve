class SignupRequestModel {
  final String name;
  final String email;
  final String password;
  final String avatar;

  SignupRequestModel({
    required this.name,
    required this.email,
    required this.password,
    this.avatar = "https://api.lorem.space/image/face?w=640&h=480",
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }
}
