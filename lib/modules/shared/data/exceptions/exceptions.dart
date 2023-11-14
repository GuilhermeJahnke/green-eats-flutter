class ServerException {
  ServerException({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  final String message;
  final int statusCode;
  final dynamic data;
}
