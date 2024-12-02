import 'dart:async';

import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/emergency_model.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';
import '../models/emergency_model.dart';

class EmergencyProvider extends ChangeNotifier {
  EmergencyModel alertModel = EmergencyModel();

  EmergencyModel1 model = EmergencyModel1();
  final _repository = Repository();
  LocalStorageService sp = LocalStorageService();
  PrefUtils prefUtils = PrefUtils();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  EmergencyProvider() {
    init();
  }

  init() async {
    await loadEmergencyData();
  }

  FutureOr<void> loadEmergencyData({
    Function? onSuccess,
    Function? onError,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.emergencyData(
      formData: {
        'operation': 'get_helplines',
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

  void onChanged(String value) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.emergencyData(
      formData: {
        'operation': 'get_helplines',
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

  Future<void> addHelpline({
    required String name,
    required String type,
    required String phone,
    required String address,
    required String status,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.orderDevice(
      formData: {
        'operation': 'add_helpline',
        'access_token': 'developer_bypass',
        'name': name,
        'type': type,
        'phone': phone,
        'address': address,
        'status': status,
        'user_id': userdata.orgId
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess(value.dESCRIPTION ?? 'Helpline added successfully.');
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.rootScreen,
            arguments: 5);
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Error adding helpline.');
      }
    });
  }

  Future<void> deleteHelpline(
    String id,
  ) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.orderDevice(
      formData: {
        'operation': 'delete_helpline',
        'id': id,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        model.dBDATA?.removeWhere((visitor) => visitor.id.toString() == id);
        showSuccess(value.dESCRIPTION ?? '');
        notifyListeners();
        await loadEmergencyData();
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Error updating alert status.');
      }
    });
  }

  Future<void> updateHelpline(DBDATA alert, String status) async {
    await _repository.orderDevice(
      formData: {
        'name': nameController.text,
        'operation': 'update_helpline',
        'address': addressController.text,
        'helpline_id': alert.id,
        'status': status
        // 'device_id': alert.deviceId,
        // 'alert_type': alert.alertType,
        // 'status': alert.status,
        // 'alert_name': alert.alertName,
        // 'alert_color': alert.alertColor,
        // 'alert_description': alert.alertDescription,
        // 'entry_time': alert.entryTime,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        await loadEmergencyData();
        showSuccess(value.dESCRIPTION ?? '');
      } else {
        showError(value.eRRORDESCRIPTION ?? '');
      }
    });
  }
}
