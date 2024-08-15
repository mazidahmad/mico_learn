import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String id;
  final String createdAt;
  final String name;
  final String email;
  final String? lastActivity;
  final int roleId;
  final String? profilePicture;
  final bool isVip;

  const Account({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    this.lastActivity,
    required this.roleId,
    this.profilePicture,
    required this.isVip,
  });

  Account copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? email,
    String? lastActivity,
    int? roleId,
    String? profilePicture,
    bool? isVip,
  }) {
    return Account(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      email: email ?? this.email,
      lastActivity: lastActivity ?? this.lastActivity,
      roleId: roleId ?? this.roleId,
      profilePicture: profilePicture ?? this.profilePicture,
      isVip: isVip ?? this.isVip,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      name,
      email,
      lastActivity,
      roleId,
      profilePicture,
      isVip,
    ];
  }
}
