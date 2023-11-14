import 'mock_request.dart';
import 'sign_in_mock_request.dart';

class MockManager {
  MockManager();

  final Map<String, MockRequest> mocks = {
    '/auth/sign-in': SignInMockRequest(),
  };

  MockRequest? getMock(String url) {
    if (mocks.containsKey(url)) {
      return mocks[url];
    }

    throw Exception('Mock not found for url: $url');
  }
}
