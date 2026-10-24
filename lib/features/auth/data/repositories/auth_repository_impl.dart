import '../../domain/entities/auth_token_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request_model.dart';
import '../models/signup_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthTokenEntity> login(String email, String password) async {
    final request = LoginRequestModel(email: email, password: password);
    final responseModel = await remoteDataSource.login(request);
    return responseModel.toEntity();
  }

  @override
  Future<UserEntity> signUp(String name, String email, String password) async {
    final request = SignupRequestModel(name: name, email: email, password: password);
    final responseModel = await remoteDataSource.signUp(request);
    return responseModel.toEntity();
  }
}
