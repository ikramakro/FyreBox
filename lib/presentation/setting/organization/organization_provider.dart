import 'package:flutter/material.dart';
import 'package:fyrebox/core/utils/navigator_service.dart';
import 'package:fyrebox/routes/app_routes.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';

class OrganizationNameProvider extends ChangeNotifier {
  TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();
  final _repository = Repository();
  PrefUtils prefUtils = PrefUtils();
  USERDATA? userdata;
  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isRetypePasswordVisible = false;
  OrganizationNameProvider() {
    oldPasswordController = TextEditingController(text: dbData?.orgName ?? '');
    init();
  }

  void init() async {
    userdata = prefUtils.getUserData();
  }

  void toggleOldPasswordVisibility() {
    isOldPasswordVisible = !isOldPasswordVisible;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    notifyListeners();
  }

  void toggleRetypePasswordVisibility() {
    isRetypePasswordVisible = !isRetypePasswordVisible;
    notifyListeners();
  }

  Future<void> changePassword() async {
    try {
      final response = await _repository.updateUserPassword(
        formData: {
          'org_name': oldPasswordController.text,
          'password': newPasswordController.text,
          'operation': 'edit_org_name'
        },
      );

      if (response.sTATUS != "ERROR") {
        // Handle success
        USERDATA userdata = prefUtils.getUserData()!;
        await _repository.orgData(
          formData: {'org_id': userdata.orgId},
        );
        // Notify listeners if there's any data that needs to update UI
        NavigatorService.popAndPushNamed(AppRoutes.rootScreen, arguments: 0);
        showSuccess(response.dESCRIPTION ?? '');
        notifyListeners();
      } else {
        // Handle error
        showError(response.eRRORDESCRIPTION ?? 'Failed to change password');
      }
    } catch (error) {
      showError('An error occurred while changing the password');
    }
  }
}
