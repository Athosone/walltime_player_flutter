import 'dart:async';
import 'package:meta/meta.dart';
import 'package:walltime_player/Domain/agent.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:walltime_player/Domain/storage_keys.dart';

abstract class AuthenticateRepository {
  Future<Agent> login(LoginCommand command);
}
  
class BaseApi {
  final storage = new FlutterSecureStorage();

  Future<void> setToken(String token) async {
    await storage.write(key: StorageKeys.TOKEN_KEY, value: token);
  }

  Future<void> purgeToken() async {
    await storage.delete(key: StorageKeys.TOKEN_KEY);
  }

  Future<String> refreshToken() async {
      String currentToken = await storage.read(key: StorageKeys.TOKEN_KEY);
      if (currentToken != null) {
        return currentToken;
      }
      // TODO call refresh token when ready.....
      throw AuthenticationError(AuthenticationErrorrReason.NoCredentialsAvailable);
  }
}

enum AuthenticationErrorrReason {
  NoCredentialsAvailable
}

class AuthenticationError implements Exception {
  AuthenticationErrorrReason reason;
  AuthenticationError(this.reason);
}

class LoginCommand {
  final String email;
  final String password;

  LoginCommand(@required this.email, @required this.password);
}
  
class AuthenticateRepositoryImp implements AuthenticateRepository {
  @override
  Future<Agent> login(LoginCommand command) {
      
  }

}