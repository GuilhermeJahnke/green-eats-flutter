import 'mock_request.dart';
import 'mock_requests/sign_in_mock_request.dart';
import 'mock_requests/sign_up_mock_request.dart';

class MockManager {
  MockManager();

  final Map<String, MockRequest> mocks = {
    '/auth/sign-in': SignInMockRequest(),
    '/auth/sign-up': SignUpMockRequest(),
  };

  MockRequest? getMock(String url) {
    if (mocks.containsKey(url)) {
      return mocks[url];
    }

    throw Exception('Mock not found for url: $url');
  }
}
