import 'environment.dart';

class DevEnvironment implements Environment {
  @override
  final String suffix = 'dev';

  @override
  final String baseUrl = '';

  @override
  final bool isMock = true;
}

class HmgEnvironment implements Environment {
  @override
  final String suffix = 'hmg';

  @override
  final String baseUrl = '';

  @override
  final bool isMock = false;
}

class ProdEnvironment implements Environment {
  @override
  final String suffix = '';

  @override
  final String baseUrl = '';

  @override
  final bool isMock = false;
}
