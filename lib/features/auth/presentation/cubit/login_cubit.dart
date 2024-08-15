import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/auth/domain/usecases/sign_in_google.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final SignInGoogle _signInGoogle = getIt<SignInGoogle>();

  void loginWithGoogle() async {
    emit(LoginLoading());

    var result = await _signInGoogle.execute();

    result.fold(
      (failure) => emit(
        LoginFailed(failure),
      ),
      (_) => emit(
        LoginSuccess(),
      ),
    );
  }
}
