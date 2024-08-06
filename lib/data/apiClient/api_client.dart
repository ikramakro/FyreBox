// ignore_for_file: body_might_complete_normally_catch_error

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';
import '../../core/app_export.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/progress_dialog_utils.dart';

class ApiClient {
  // final _config = locator<Config>();
  String getbaseurl = 'https://fyreboxhub.com/api/get_data';
  Future<Dio> launchDio() async {
    // String? accessToken = LocalStorageService().accessToken;
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';
    // dio.options.headers['Authorization'] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  get(
      {required String baseUrl,
      required Map<String, dynamic>? formData}) async {
    var connected = await NetworkInfo().isConnected();
    ProgressDialogUtils.showProgressDialog();
    final response;
    if (connected) {
      Dio dio = await launchDio();
      try {
        response = await dio.get(baseUrl, queryParameters: formData);
        ProgressDialogUtils.hideProgressDialog();
        if (response.statusCode == 200) {
          return response;
        } else if (response.statusCode == 500) {
        } else {}
      } on DioException catch (e) {
        ProgressDialogUtils.hideProgressDialog();
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        showError(e.toString());
        if (e.response != null) {
          ProgressDialogUtils.hideProgressDialog();

          debugPrint('1111111 ${e.response!.data.toString()}');
          debugPrint('22222222 ${e.response!.headers.toString()}');
          debugPrint('3333333 ${e.response!.requestOptions.toString()}');
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          debugPrint(e.requestOptions.toString());
          debugPrint(e.message.toString());
          ProgressDialogUtils.hideProgressDialog();
        }
      }
    } else {
      ProgressDialogUtils.hideProgressDialog();
      toastification.dismissAll();
      (animation: false);
      showError('No internet connection');
    }
  }

  post({required String baseUrl, required formdata}) async {
    var connected = await NetworkInfo().isConnected();

    if (connected) {
      Dio dio = await launchDio();
      // print(' == $baseUrl $formdata');
      final response = await dio.post(baseUrl, queryParameters: formdata);

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        return response;
      } else if (response.statusCode == 500) {
      } else {}
    } else {
      toastification.dismissAll();
      (animation: false);
      showError('No internet connection');

      // throw Exception('No internet connection');
    }
  }

  put({required String baseUrl, required String endPoint, data}) async {
    Dio dio = await launchDio();
    final response =
        await dio.put('$baseUrl/$endPoint', data: data).catchError((e) {
      debugPrint('Unexpected Error');
    });
    if (response.statusCode == 200) {
    } else if (response.statusCode == 500) {
    } else {}
  }

  post1(
      {required String baseUrl, required formdata, String? contantType}) async {
    var connected = await NetworkInfo().isConnected();
    ProgressDialogUtils.showProgressDialog();
    if (connected) {
      Dio dio = await launchDio();
      try {
        final response = await dio.post(
          baseUrl,
          data: formdata,
          options: Options(
              contentType: contantType ?? 'application/json',
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        );
        ProgressDialogUtils.hideProgressDialog();
        return response;
      } on DioException catch (e) {
        ProgressDialogUtils.hideProgressDialog();
        showError(e.toString());
        if (e.response != null) {
          ProgressDialogUtils.hideProgressDialog();
        } else {
          debugPrint(e.requestOptions.toString());
          debugPrint(e.message.toString());
        }
      }
    } else {
      toastification.dismissAll();
      showError('No internet connection');
    }
    return null;
  }

  delete({required String baseUrl, required String endPoint, params}) async {
    Dio dio = await launchDio();
    final response = await dio
        .delete('$baseUrl/$endPoint', queryParameters: params)
        .catchError((e) {
      debugPrint('Unexpected Error');
    });
    if (response.statusCode == 200) {
    } else if (response.statusCode == 500) {
    } else {}
  }
}



// import 'package:dio/dio.dart';
// import '../../core/app_export.dart';
// import '../../core/errors/exceptions.dart';
// import '../../core/utils/progress_dialog_utils.dart';
// import '../models/loginDeviceAuth/post_login_device_auth_req.dart';
// import '../models/loginDeviceAuth/post_login_device_auth_resp.dart';
// import 'network_interceptor.dart';

// // ignore_for_file: must_be_immutable

// class ApiClient {
//   factory ApiClient() {
//     return _apiClient;
//   }

//   ApiClient._internal();

//   var url = "https://nodedemo.dhiwise.co";
//   static final ApiClient _apiClient = ApiClient._internal();

//   final _dio = Dio(BaseOptions(
//     connectTimeout: const Duration(seconds: 60),
//   ))
//     ..interceptors.add(NetworkInterceptor());

//   /// Method can be used for checking internet connection
//   /// Returns [bool] based on availability of internet
//   Future isNetworkConnected() async {
//     if (!await NetworkInfo().isConnected()) {
//       throw NoInternetException('No Internet Found!');
//     }
//   }

//   /// Is `true` when the response status code is between 200 and 299
//   ///
//   /// User can modify this method with custom logics based on their API response
//   bool _isSuccessCall(Response response) {
//     if (response.statusCode != null) {
//       return response.statusCode! >= 200 && response.statusCode! <= 299;
//     }
//     return false;
//   }

//   /// Performs API call for https://nodedemo.dhiwise.co/device/auth/login
//   ///
//   /// Sends a POST request to the server's 'https://nodedemo.dhiwise.co/device/auth/login' endpoint
//   /// with the provided headers and request data
//   /// Returns a [PostLoginDeviceAuthResp] object representing the response.
//   /// Throws an error if the request fails or an exception occurs.
//   Future<PostLoginDeviceAuthResp> loginDeviceAuth({
//     Map<String, String> headers = const {},
//     Map requestData = const {},
//   }) async {
//     ProgressDialogUtils.showProgressDialog();
//     try {
//       await isNetworkConnected();
//       var response = await _dio.post(
//         '$url/device/auth/login',
//         data: requestData,
//         options: Options(headers: headers),
//       );
//       ProgressDialogUtils.hideProgressDialog();
//       if (_isSuccessCall(response)) {
//         return PostLoginDeviceAuthResp.fromJson(response.data);
//       } else {
//         throw response.data != null
//             ? PostLoginDeviceAuthResp.fromJson(response.data)
//             : 'Something Went Wrong!';
//       }
//     } catch (error, stackTrace) {
//       ProgressDialogUtils.hideProgressDialog();
//       Logger.log(
//         error,
//         stackTrace: stackTrace,
//       );
//       rethrow;
//     }
//   }
// }
