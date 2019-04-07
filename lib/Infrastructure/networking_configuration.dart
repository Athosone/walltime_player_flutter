import 'package:shared_preferences/shared_preferences.dart';
import 'package:walltime_player/Domain/storage_keys.dart';

enum Environment {
  LIVE,
  STAGING,
}

final Environment currentEnvironment = Environment.STAGING;

class NetworkingConfiguration {
  Environment environment;
  SharedPreferences prefs;

  NetworkingConfiguration() {
    setupConfiguration();
  }

  void setupConfiguration() async {
    this.prefs = await SharedPreferences.getInstance();
    String envStr = prefs.getString(StorageKeys.CURRENT_ENVIRONMENT_KEY);
    if (envStr == null) {
      envStr = currentEnvironment.toString();
    }
    this.environment = buildEnv(envStr);
  }


  Environment buildEnv(String envStr) {
    if (envStr == null) {
      return null;
    } 
    if (envStr == Environment.LIVE.toString()) {
      return Environment.LIVE;
    }
    if (envStr == Environment.STAGING.toString()) {
      return Environment.STAGING;
    }
  }
}