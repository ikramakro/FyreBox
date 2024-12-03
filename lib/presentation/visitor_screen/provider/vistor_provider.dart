import 'dart:async';

import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/models/vistors_model.dart';
import '../../../data/repository/repository.dart';
import '../models/vistor_model.dart';

class VisitorProvider extends ChangeNotifier {
  VistorModel visitorModel = VistorModel();

  VistorResponse model = VistorResponse();
  final _repository = Repository();
  LocalStorageService sp = LocalStorageService();
  PrefUtils prefUtils = PrefUtils();
  USERDATA? userdata;
  VisitorProvider() {
    init();
  }

  init() async {
    await loadVisitorData();
    userdata = prefUtils.getUserData();
  }

  FutureOr<void> loadVisitorData({
    Function? onSuccess,
    Function? onError,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.vistorData(
      formData: {'operation': 'get_visitor', 'org_id': userdata.orgId},
    ).then((value) async {
      model = value;
      if (model.sTATUS != "ERROR") {
        notifyListeners();
      } else {
        showError(model.eRRORDESCRIPTION ?? '');
      }
    });
  }

  FutureOr<void> deleteVisitorData({String? id}) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.deleteVisoterData(
      formData: {'operation': 'delete_visitor', 'id': id},
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        // Remove the visitor from the list
        model.dBDATA?.removeWhere((visitor) => visitor.id.toString() == id);

        // Notify listeners to rebuild the UI
        notifyListeners();

        showSuccess('Visitor deleted successfully');
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Failed to delete visitor');
      }
    }).catchError((error) {
      showError('An error occurred while deleting the visitor');
    });
  }

  Future<void> archivealert(String alertId, String alphaid) async {
    // USERDATA userdata = prefUtils.getUserData()!;

    await _repository.orderDevice(
      formData: {
        'operation': 'archive_visitor',
        'alert_id': alertId,
        'visitor_alpha_id': alphaid
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess(value.dESCRIPTION ?? '');
        await loadVisitorData();
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Error Deleting alert status.');
      }
    });
  }

  FutureOr<void> updateVisitorData(
      {String? id,
      String? visitorName,
      String? visitorStatus,
      String? visitorPhone,
      String? alphaid}) async {
    print('$visitorPhone');
    await _repository.deleteVisoterData(
      formData: {
        'operation': 'update_visitor',
        'visitor_id': id,
        'visitor_alpha_id': alphaid,
        'visitor_name': visitorName,
        'visitor_status': visitorStatus,
        'visitor_phone': visitorPhone,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        // Remove the visitor from the list

        notifyListeners();
        loadVisitorData();
        showSuccess('Visitor Updated successfully');
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Failed to Updated visitor');
      }
    }).catchError((error) {
      showError('An error occurred while deleting the visitor');
    });
  }

  void onChanged(String value) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.vistorData(
      formData: {
        'operation': 'get_visitors',
        // 'access_token': 'developer_bypass',
        'org_id': userdata.orgId,
        'status': value == 'Active'
            ? '1'
            : value == 'In-Active'
                ? '0'
                : value == 'Permanent Employees'
                    ? '4'
                    : '2'
      },
    ).then((value) async {
      model = value;
      if (model.sTATUS != "ERROR") {
        notifyListeners();
      } else {
        showError(model.eRRORDESCRIPTION ?? '');
      }
    });
  }
}
