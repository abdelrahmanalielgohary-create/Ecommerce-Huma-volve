import '../../domain/entities/auth_token_entity.dart';

class LoginResponseModel {
  final String? accessToken;
  final String? refreshToken;

  LoginResponseModel({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  AuthTokenEntity toEntity() {
    return AuthTokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
