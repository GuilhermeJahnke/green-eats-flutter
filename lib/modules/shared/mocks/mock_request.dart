enum MockRequestType { get, post, put, delete }

abstract class MockRequest {
  String get url;
  int get statusCode;
  MockRequestType get method;
  Map<String, dynamic>? get body;
  Map<String, dynamic>? get response;
}
