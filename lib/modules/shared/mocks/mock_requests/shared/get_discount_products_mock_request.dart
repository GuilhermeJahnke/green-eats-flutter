import '../../mock_maps/shared/get_discount_products_mock_map.dart';
import '../../mock_request.dart';

class GetDiscountProductsMockRequest extends MockRequest {
  @override
  dynamic get body => GetDiscountProductsMockMap.body;

  @override
  MockRequestType get method => MockRequestType.get;

  @override
  dynamic get response => GetDiscountProductsMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/products/getAllDiscount';
}
