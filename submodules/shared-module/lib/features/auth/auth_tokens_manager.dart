abstract class AuthTokensManager {
  static const String authModel = "auth";

  Future<void> saveAccessToken(String? token);

  Future<void> saveRefreshToken(String? token);

  Future<String?> loadAccessToken();

  Future<String?> loadRefreshToken();

  Future<void> saveMetaData(String name, String? data);

  Future<String?> loadMetaData(String name);
}
