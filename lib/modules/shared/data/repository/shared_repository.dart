import '../../domain/usecases/get_cookie_usecase.dart';
import '../../domain/usecases/set_cookie_usecase.dart';
import '../datasources/local_datasource/local_datasource.dart';

class SharedRepository implements GetCookieUsecase, SetCookieUsecase {
  const SharedRepository({
    required this.localDatasource,
  });

  final LocalDatasource localDatasource;

  @override
  Future<String?> getCookie() async {
    final cookie = await localDatasource.getCookie();

    return cookie;
  }

  @override
  Future<void> setCookie(String cookie) async {
    await localDatasource.setCookie(cookie);

    return;
  }
}
