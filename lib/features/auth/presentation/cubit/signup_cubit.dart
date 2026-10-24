import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  Future<void> signUp(String name, String email, String password) async {
    emit(SignUpLoading());
    try {
      final user = await signUpUseCase(name, email, password);
      emit(SignUpSuccess(user));
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
