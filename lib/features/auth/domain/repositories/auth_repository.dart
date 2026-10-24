import '../entities/auth_token_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<AuthTokenEntity> login(String email, String password);
  Future<UserEntity> signUp(String name, String email, String password);
}
