import '../apiClient/api_client.dart';

import '../models/base_model.dart';
import '../models/dashboard_model.dart';
import '../models/device_model.dart';
import '../models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../models/user_data_model.dart';

/// Repository class for managing API requests.
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();
  Future<PostLoginDeviceAuthResp> login(
      {Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return PostLoginDeviceAuthResp.fromJson(response.data);
  }

  Future<DashboardModel> dashboardData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/get_data',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return DashboardModel.fromJson(response.data);
  }

  Future<BaseModel> register({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php', formdata: formData);
    return BaseModel.fromJson(response.data);
  }

  Future<UserDataModel> userData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return UserDataModel.fromJson(response.data);
  }

  Future<BaseModel> addUser({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<DeviceResponse> deviceData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return DeviceResponse.fromJson(response.data);
  }
}
