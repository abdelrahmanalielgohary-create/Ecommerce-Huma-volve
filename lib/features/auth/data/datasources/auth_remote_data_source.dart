import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
  Future<SignupResponseModel> signUp(SignupRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.loginEndpoint,
      data: request.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<SignupResponseModel> signUp(SignupRequestModel request) async {
    final response = await apiClient.dio.post(
      ApiEndpoints.signupEndpoint,
      data: request.toJson(),
    );
    return SignupResponseModel.fromJson(response.data);
  }
}
