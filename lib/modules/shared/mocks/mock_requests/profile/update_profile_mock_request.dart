import '../../mock_maps/profile/update_profile_mock_map.dart';
import '../../mock_request.dart';

class UpdateProfileMockRequest extends MockRequest {
  @override
  Map<String, dynamic>? get body => UpdateProfileMockMap.body;

  @override
  MockRequestType get method => MockRequestType.put;

  @override
  Map<String, dynamic>? get response => UpdateProfileMockMap.response;

  @override
  int get statusCode => 200;

  @override
  String get url => '/profile/update';
}
