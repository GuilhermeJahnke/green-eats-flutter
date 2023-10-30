abstract class LocalDatasource {
  Future<void> setCookie(String cookie);
  Future<String?> getCookie();
}
