import '../../mock_maps/products/get_products_by_category_mock_map.dart';
import '../../mock_request.dart';

class GetProductsByCategoryMockRequest extends MockRequest {
  @override
  dynamic get body => GetProductsByCategoryMockMap.body;

  @override
  MockRequestType get method => MockRequestType.get;

  @override
  dynamic get response => GetProductsByCategoryMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/products/getAllByCategory';
}
