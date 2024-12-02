import 'package:fyrebox/data/models/device_type.dart';
import 'package:fyrebox/data/models/org_type.dart';

import '../../core/utils/constant.dart';
import '../apiClient/api_client.dart';

import '../models/alert_model.dart';
import '../models/base_model.dart';
import '../models/dashboard_model.dart';
import '../models/device_model.dart';
import '../models/emergency_model.dart';
import '../models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../models/org_detail.dart';
import '../models/register_model.dart';
import '../models/user_data_model.dart';
import '../models/vistors_model.dart';

/// Repository class for managing API requests.
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();
  Future<AuthResponse> login({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return AuthResponse.fromJson(response.data);
  }

  Future<DeviceTypeResponse> deviceType(
      {Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return DeviceTypeResponse.fromJson(response.data);
  }

  Future<OrgType> orgType({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return OrgType.fromJson(response.data);
  }

  Future<DashboardModel> dashboardData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/get_data',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return DashboardModel.fromJson(response.data);
  }

  Future<RegisterModel> register({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return RegisterModel.fromJson(response.data);
  }

  Future<UserDataModel> userData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data', formData: formData);
    return UserDataModel.fromJson(response.data);
  }

  Future<AlertResponse> alertData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data.php', formData: formData);
    return AlertResponse.fromJson(response.data);
  }

  Future<EmergencyModel1> emergencyData(
      {Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data.php', formData: formData);
    return EmergencyModel1.fromJson(response.data);
  }

  Future<BaseModel> addUser({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<BaseModel> updateUserDetails({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<BaseModel> updateUserPassword({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<BaseModel> contactFyreBox({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<BaseModel> addDevice({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<BaseModel> orderDevice({Map<String, dynamic>? formData}) async {
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

  Future<VistorResponse> vistorData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_data.php', formData: formData);
    return VistorResponse.fromJson(response.data);
  }

  Future<BaseModel> deleteVisoterData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.post1(
        baseUrl: 'https://fyreboxhub.com/api/set_data.php',
        formdata: formData,
        contantType: "application/x-www-form-urlencoded");
    return BaseModel.fromJson(response.data);
  }

  Future<Organization> orgData({Map<String, dynamic>? formData}) async {
    final response = await _apiClient.get(
        baseUrl: 'https://fyreboxhub.com/api/get_org_details',
        formData: formData);
    evacuationMaps =
        Organization.fromJson(response.data).dbData?.evacuationMaps ?? [];
    helplines = Organization.fromJson(response.data).dbData?.helplines ?? [];
    dbData = Organization.fromJson(response.data).dbData;
    return Organization.fromJson(response.data);
  }
}
// https://fyreboxhub.com/api/get_data.php?operation=get_visitor&org_id=1