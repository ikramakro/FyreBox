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

  VisitorProvider() {
    init();
  }

  init() async {
    await loadVisitorData();
  }

  FutureOr<void> loadVisitorData({
    Function? onSuccess,
    Function? onError,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.vistorData(
      formData: {
        'operation': 'get_visitor',
        'access_token': 'developer_bypass',
        'org_id': userdata.orgId
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

  void onChanged(String value) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.vistorData(
      formData: {
        'operation': 'get_visitors',
        // 'access_token': 'developer_bypass',
        'org_id': userdata.orgId,
        'status': value == 'Active' ? '1' : '0'
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