import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/dashboard_model.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';
import '../models/deshboard_model.dart';

class DeshboardProvider extends ChangeNotifier {
  DeshboardModel deshboardModelObj = DeshboardModel();
  DashboardModel model = DashboardModel();
  final _repository = Repository();
  LocalStorageService sp = LocalStorageService();
  PrefUtils prefUtils = PrefUtils();
  DeshboardProvider() {
    // Initialize the model here
    init();
  }
  init() async {
    await loadDashboardData();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    await orderDevice();
  }

  FutureOr<void> orderDevice() async {
    USERDATA userdata = prefUtils.getUserData()!;
    await _repository.orgData(
      formData: {'org_id': userdata.orgId},
    );
    // Notify listeners if there's any data that needs to update UI
    notifyListeners();
  }

  FutureOr<void> loadDashboardData({
    Function? onSuccess,
    Function? onError,
  }) async {
    // sp.saveToDisk('orgid', postLoginDeviceAuthResp.uSERDATA?.orgId ?? '');
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.dashboardData(
      formData: {
        'operation': 'get_dashboard_data',
        // 'access_token': 'developer_bypass',
        'org_id': userdata.orgId
      },
    ).then((value) async {
      model = value;
      if (model.sTATUS != "ERROR") {
        // onSuccess!.call();
        notifyListeners();
      } else {
        showError(model.errorDescription ?? '');
        // notifyListeners();
      }
    });
  }
}
