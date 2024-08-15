part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLogoutSuccess extends ProfileState {}

final class ProfileLogoutFailed extends ProfileState {
  final Failure failure;

  const ProfileLogoutFailed(this.failure);
}
