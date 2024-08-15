import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/config/app_config.dart';
import 'package:mico_learn/core/error/network_exception.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:mico_learn/features/auth/data/models/account_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/di/service_locator.dart';

abstract class AuthRemoteDatasource {
  Future<GoogleSignInAuthentication> googleSignIn();
  Future<AuthResponse> supabaseGoogleSignIn(String idToken, String accessToken);
  Future<bool> checkIsUserRegistered(String email);
  Future<void> registerUser(User user);
  Future<AccountModel> getAccountInfo(String email);
}

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();
  final GoogleSignIn _googleClient = getIt<GoogleSignIn>();

  @override
  Future<GoogleSignInAuthentication> googleSignIn() async {
    var resultGoogle = await _googleClient.signIn();

    if (resultGoogle == null) {
      throw const ServerException(errMessage: 'Something went wrong');
    }

    var googleAuth = await resultGoogle.authentication;

    var idToken = googleAuth.idToken;
    var accessToken = googleAuth.accessToken;

    if (idToken == null) {
      throw const ServerException(errMessage: 'No ID Token Found');
    }
    if (accessToken == null) {
      throw const ServerException(errMessage: 'No Access Token Found');
    }
    return googleAuth;
  }

  @override
  Future<AuthResponse> supabaseGoogleSignIn(
      String idToken, String accessToken) async {
    return await _supabaseModule.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<bool> checkIsUserRegistered(String email) async {
    var response = await _supabaseModule.client
        .from('account')
        .select('email')
        .eq('email', email);

    var data = response.firstOrNull;
    if (data == null || data.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Future<void> registerUser(User user) async {
    var isVip = AppConfig.vipEmailUsers.any((email) => user.email == email);
    var userData = AccountModel(
        id: user.id,
        createdAt: user.createdAt,
        name: user.userMetadata!['full_name'],
        email: user.email!,
        roleId: 2,
        isVip: isVip,
        lastActivity: DateTime.now().toUtc().toIso8601String(),
        profilePicture: user.userMetadata?['avatar_url']);

    await _supabaseModule.client.from('account').insert(userData.toMap());
  }

  @override
  Future<AccountModel> getAccountInfo(String email) async {
    var response = await _supabaseModule.client
        .from('account')
        .select()
        .eq('email', email)
        .single();

    return AccountModel.fromMap(response);
  }
}
