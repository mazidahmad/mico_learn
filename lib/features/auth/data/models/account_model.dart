import 'dart:convert';

import 'package:mico_learn/features/auth/domain/entities/account.dart';

class AccountModel extends Account {
  const AccountModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.email,
    required super.roleId,
    required super.isVip,
    super.lastActivity,
    super.profilePicture,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'name': name,
      'email': email,
      'role_id': roleId,
      'last_activity': lastActivity,
      'profile_picture': profilePicture,
      'is_vip': isVip,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as String,
      createdAt: map['created_at'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      lastActivity:
          map['last_activity'] != null ? map['last_activity'] as String : null,
      roleId: map['role_id'] as int,
      profilePicture: map['profile_picture'] != null
          ? map['profile_picture'] as String
          : null,
      isVip: map['is_vip'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
