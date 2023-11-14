import 'mock_request.dart';
import 'sign_in_mock_request.dart';

class MockRequestList {
  const MockRequestList._();

  static Map<String, MockRequest> mocks = {
    '/auth/sign-in': SignInMockRequest(),
  };
}
