import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/profile/domain/usecases/logout_account.dart';

import '../../../../core/di/service_locator.dart';

part 'profile_state.dart';

@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final LogoutAccount _logoutAccount = getIt<LogoutAccount>();

  void logoutAccount() async {
    emit(ProfileLoading());

    var result = await _logoutAccount.execute();

    result.fold(
      (failure) => emit(ProfileLogoutFailed(failure)),
      (_) => emit(
        ProfileLogoutSuccess(),
      ),
    );
  }
}
