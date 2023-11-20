import 'mock_request.dart';
import 'mock_requests/authentication/sign_in_mock_request.dart';
import 'mock_requests/authentication/sign_up_mock_request.dart';
import 'mock_requests/orders/get_all_orders_mock_request.dart';
import 'mock_requests/orders/send_order_mock_request.dart';
import 'mock_requests/products/get_products_by_category_mock_request.dart';
import 'mock_requests/profile/update_profile_mock_request.dart';
import 'mock_requests/shared/get_category_mock_request.dart';
import 'mock_requests/shared/get_discount_products_mock_request.dart';
import 'mock_requests/shared/get_products_mock_request.dart';

class MockManager {
  MockManager();

  final Map<String, MockRequest> mocks = {
    '/auth/sign-in': SignInMockRequest(),
    '/auth/sign-up': SignUpMockRequest(),
    '/category/getAll': GetCategoryMockRequest(),
    '/products': GetProductsMockRequest(),
    '/products/getAllDiscount': GetDiscountProductsMockRequest(),
    '/users': UpdateProfileMockRequest(),
    '/products/getAllByCategory': GetProductsByCategoryMockRequest(),
    // '/orders': GetAllOrdersMockRequest(),
    // '/orders': SendOrderMockRequest(),
  };

  MockRequest? getMock(String url) {
    if (mocks.containsKey(url)) {
      return mocks[url];
    }

    throw Exception('Mock not found for url: $url');
  }
}
