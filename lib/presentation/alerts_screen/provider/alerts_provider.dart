import 'dart:async';
import 'dart:developer';

import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/alert_model.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';
import '../models/alerts_model.dart';

class AlertsProvider extends ChangeNotifier {
  AlertsModel alertModel = AlertsModel();

  AlertResponse model = AlertResponse();
  final _repository = Repository();
  LocalStorageService sp = LocalStorageService();
  PrefUtils prefUtils = PrefUtils();
  String? selectedStatus;
  List<DBDATA> _filteredAlerts = []; // Holds filtered data
  AlertsProvider() {
    init();
  }

  init() async {
    await loadAlertData();
  }

  // void filterAlertsByDate(DateTime startDate, DateTime endDate) {
  //   log('Start Date ${startDate.toString()}');
  //   log('End Date ${endDate.toString()}');
  //   if (model.dBDATA != null) {
  //     _filteredAlerts = model.dBDATA!.where((alert) {
  //       DateTime alertDate = DateTime.parse(alert.entryTimeFormated ?? '');
  //       log('Alert Date ${alertDate.toString()}');
  //       return alertDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
  //           alertDate.isBefore(endDate.add(const Duration(days: 1)));
  //     }).toList();
  //     model.dBDATA = _filteredAlerts;
  //   }
  //   notifyListeners();
  // }
  void filterAlertsByDate(DateTime startDate, DateTime endDate) {
    log('Start Date: ${startDate.toString()}');
    log('End Date: ${endDate.toString()}');

    if (model.dBDATA != null) {
      _filteredAlerts = model.dBDATA!.where((alert) {
        try {
          // Convert Unix time (seconds) to DateTime
          int unixTime = int.tryParse(alert.entryTimeFormated ?? '0') ?? 0;
          DateTime alertDate =
              DateTime.fromMillisecondsSinceEpoch(unixTime * 1000, isUtc: true);

          log('Alert Date: ${alertDate.toString()}');

          // Compare the converted date with start and end date
          return alertDate
                  .isAfter(startDate.subtract(const Duration(days: 1))) &&
              alertDate.isBefore(endDate.add(const Duration(days: 1)));
        } catch (e) {
          log('Error parsing date: $e');
          return false;
        }
      }).toList();

      // Do not overwrite the original list, only use _filteredAlerts
      notifyListeners();
    }
  }

  void setSelectedStatus(String? status) {
    selectedStatus = status;
    notifyListeners();
  }

  FutureOr<void> loadAlertData({
    Function? onSuccess,
    Function? onError,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.alertData(
      formData: {'operation': 'get_alerts', 'user_id': userdata.orgId},
    ).then((value) async {
      model = AlertResponse();
      model = value;
      if (model.sTATUS != "ERROR") {
        notifyListeners();
      } else {
        showError(model.errorDescription ?? '');
      }
    });
  }

  Future<void> updateAlertStatus(String alertId, String selectedStatus) async {
    // USERDATA userdata = prefUtils.getUserData()!;

    await _repository.orderDevice(
      formData: {
        'operation': 'update_alert',
        'alert_id': alertId,
        'alert_status': selectedStatus,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess(value.dESCRIPTION ?? '');
        await loadAlertData();
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Error updating alert status.');
      }
    });
  }

  Future<void> deleteAlert(
    String alertId,
  ) async {
    // USERDATA userdata = prefUtils.getUserData()!;

    await _repository.orderDevice(
      formData: {
        'operation': 'delete_alert',
        'access_token': 'developer_bypass',
        'alert_id': alertId,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess(value.dESCRIPTION ?? '');
        await loadAlertData();
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Error Deleting alert status.');
      }
    });
  }

  Future<void> archivealert(
    String alertId,
  ) async {
    // USERDATA userdata = prefUtils.getUserData()!;

    await _repository.orderDevice(
      formData: {
        'operation': 'archive_alert',
        'alert_id': alertId,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess(value.dESCRIPTION ?? '');
        await loadAlertData();
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Error Deleting alert status.');
      }
    });
  }
  // void onChanged(String value) async {
  //   // For filtered data
  //   String org = await prefUtils.getOrgValue('orgid');

  //   if (value == 'Active') {
  //     await _repository.deviceData(
  //       formData: {
  //         'operation': 'get_devices',
  //         'access_token': 'developer_bypass',
  //         'org_id': org,
  //         'status': '1'
  //       },
  //     ).then((value) async {
  //       model = value;
  //       if (model.status != "ERROR") {
  //         notifyListeners();
  //       } else {
  //         showError(model.errorDescription ?? '');
  //       }
  //     });
  //   } else if (value == 'In-Active') {
  //     await _repository.deviceData(
  //       formData: {
  //         'operation': 'get_devices',
  //         'access_token': 'developer_bypass',
  //         'org_id': org,
  //         'status': '0'
  //       },
  //     ).then((value) async {
  //       model = value;
  //       if (model.status != "ERROR") {
  //         notifyListeners();
  //       } else {
  //         showError(model.errorDescription ?? '');
  //       }
  //     });
  //   } else {
  //     await _repository.deviceData(
  //       formData: {
  //         'operation': 'get_devices',
  //         'access_token': 'developer_bypass',
  //         'org_id': org,
  //       },
  //     ).then((value) async {
  //       model = value;
  //       if (model.status != "ERROR") {
  //         notifyListeners();
  //       } else {
  //         showError(model.errorDescription ?? '');
  //       }
  //     });
  //   }
  //   notifyListeners();
  // }
  void onChanged(String value) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.alertData(
      formData: {
        'operation': 'get_alerts',
        'access_token': 'developer_bypass',
        'org_id': userdata.orgId,
        'status': value == 'Active'
            ? '1'
            : value == 'In-Active'
                ? '0'
                : value == 'All'
                    ? ''
                    : '3'
      },
    ).then((value) async {
      model = value;
      if (model.sTATUS != "ERROR") {
        notifyListeners();
      } else {
        showError(model.errorDescription ?? '');
      }
    });
  }

  // Future<void> updateAlert(DBData alert) async {
  //   await _repository.updateAlert(
  //     formData: {
  //       'operation': 'update_alert',
  //       'access_token': 'developer_bypass',
  //       'alert_id': alert.id,
  //       'device_id': alert.deviceId,
  //       'alert_type': alert.alertType,
  //       'status': alert.status,
  //       'alert_name': alert.alertName,
  //       'alert_color': alert.alertColor,
  //       'alert_description': alert.alertDescription,
  //       'entry_time': alert.entryTime,
  //     },
  //   ).then((value) async {
  //     if (value.sTATUS != "ERROR") {
  //       showSuccess(value.dESCRIPTION ?? '');
  //       await loadAlertData();
  //     } else {
  //       showError(value.eRRORDESCRIPTION ?? '');
  //     }
  //   });
  // }
}
