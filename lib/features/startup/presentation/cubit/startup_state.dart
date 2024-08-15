part of 'startup_cubit.dart';

sealed class StartupState extends Equatable {
  const StartupState();

  @override
  List<Object> get props => [];
}

final class StartupInitial extends StartupState {}

final class StartupLoading extends StartupState {}

final class StartupLogedIn extends StartupState {}

final class StartupOnBoard extends StartupState {}

final class StartupFailed extends StartupState {
  final Failure failure;

  const StartupFailed(this.failure);
}
