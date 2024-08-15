import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/startup/domain/usecases/is_has_session.dart';

part 'startup_state.dart';

@Injectable()
class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupInitial());

  final IsHasSession _isHasSession = getIt<IsHasSession>();

  void checkSession() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(StartupLoading());
    await Future.delayed(const Duration(seconds: 1));

    var result = await _isHasSession.execute();

    emit(
      result.fold(
        (failure) => StartupFailed(failure),
        (isHasSession) {
          if (isHasSession) {
            return StartupLogedIn();
          }
          return StartupOnBoard();
        },
      ),
    );
  }
}
