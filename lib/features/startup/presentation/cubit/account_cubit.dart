import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/features/auth/domain/entities/account.dart';
import 'package:mico_learn/features/startup/domain/usecases/get_account_info.dart';

@LazySingleton()
class AccountCubit extends Cubit<Account?> {
  AccountCubit() : super(null);

  final GetAccountInfo _getAccountInfo = getIt<GetAccountInfo>();

  void getAccountInfo() async {
    var result = await _getAccountInfo.execute();

    result.fold((failure) => emit(null), (account) => emit(account));
  }
}
