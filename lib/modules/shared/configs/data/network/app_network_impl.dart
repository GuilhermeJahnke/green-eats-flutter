import 'app_network.dart';

class AppNetworkImpl extends AppNetwork {
  AppNetworkImpl({required super.environment});

  @override
  String get baseUrl => environment.baseUrl;
}
