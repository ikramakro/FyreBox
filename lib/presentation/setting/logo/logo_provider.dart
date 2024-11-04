import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyrebox/core/utils/pref_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class OrganizationProvider extends ChangeNotifier {
  File? _logo;
  File? _map;
  bool _isUploadingLogo = false;
  bool _isUploadingMap = false;
  final picker = ImagePicker();
  final Dio dio = Dio(); // Initialize Dio instance

  File? get logo => _logo;
  File? get map => _map;
  bool get isUploadingLogo => _isUploadingLogo;
  bool get isUploadingMap => _isUploadingMap;

  // Pick logo from gallery
  Future<void> pickLogo() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _logo = File(pickedFile.path);
      notifyListeners(); // Notify listeners that logo is selected
    }
  }

  // Pick map from gallery
  Future<void> pickMap() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _map = File(pickedFile.path);
      notifyListeners(); // Notify listeners that map is selected
    }
  }

  // Upload organization logo
  Future<void> uploadLogo() async {
    if (_logo == null) return;
    String? accessToken = PrefUtils().getAccessToken();
    _isUploadingLogo = true;
    notifyListeners(); // Notify listeners to show loading indicator

    final url =
        'https://fyreboxhub.com/api/set_data.php?operation=update_organization_logo&access_token=$accessToken!';

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          _logo!.path,
        ),
      });

      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        print('Logo uploaded successfully');
        print(response.data);
      } else {
        print('Failed to upload logo');
      }
    } catch (e) {
      print('Error uploading logo: $e');
    } finally {
      _isUploadingLogo = false;
      notifyListeners(); // Notify listeners to hide loading indicator
    }
  }

  // Upload organization map
  Future<void> uploadMap() async {
    if (_map == null) return;

    _isUploadingMap = true;
    notifyListeners(); // Notify listeners to show loading indicator

    const url = 'https://your-api-endpoint.com/upload-map';

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(_map!.path,
            filename: _map!.path.split('/').last),
      });

      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        print('Map uploaded successfully');
      } else {
        print('Failed to upload map');
      }
    } catch (e) {
      print('Error uploading map: $e');
    } finally {
      _isUploadingMap = false;
      notifyListeners(); // Notify listeners to hide loading indicator
    }
  }
}
