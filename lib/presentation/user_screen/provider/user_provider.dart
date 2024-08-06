import 'dart:async';
import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/models/user_data_model.dart';
import '../../../data/repository/repository.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel userModelObj = UserModel();

  UserDataModel model = UserDataModel();
  final _repository = Repository();
  LocalStorageService sp = LocalStorageService();
  PrefUtils prefUtils = PrefUtils();
  bool isOrganizationOwner = false;
  String? selectedUserRole;
  bool hasFullAccess = false;
  bool hasInsertAccess = false;
  bool hasUpdateAccess = false;
  bool hasDeleteAccess = false;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserProvider() {
    init();
  }

  init() async {
    await loadDashboardData();
  }

  FutureOr<void> addUser({
    Function? onSuccess,
    Function? onError,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.addUser(
      formData: {
        'user_name': userNameController.text,
        'org_id': userdata.orgId,
        'org_amdin': isOrganizationOwner ? '1' : '0',
        'user_email': emailController.text,
        'user_password': passwordController.text,
        'user_role_type': selectedUserRole == 'Admin' ? '1' : '2',
        'full_access': hasFullAccess ? '1' : '0',
        'insert_access': hasInsertAccess ? '1' : '0',
        'update_access': hasUpdateAccess ? '1' : '0',
        'delete_access': hasDeleteAccess ? '1' : '0',
        'operation': 'add_org_user',
        'access_token': 'developer_bypass',
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess(value.dESCRIPTION ?? '');
        NavigatorService.popAndPushNamed(AppRoutes.rootScreen, arguments: 1);
        notifyListeners();
      } else {
        showError(value.eRRORDESCRIPTION ?? '');
      }
    });
  }

  FutureOr<void> loadDashboardData({
    Function? onSuccess,
    Function? onError,
  }) async {
    USERDATA userdata = prefUtils.getUserData()!;

    await _repository.userData(
      formData: {
        'operation': 'get_user_data',
        'access_token': 'developer_bypass',
        'org_id': userdata.orgId
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

  onSelected(dynamic value) {
    for (var element in userModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  void setOrganizationOwner(bool value) {
    isOrganizationOwner = value;
    notifyListeners();
  }

  void setUserRole(String role) {
    selectedUserRole = role;
    notifyListeners();
  }

  void setFullAccess(bool value) {
    hasFullAccess = value;
    notifyListeners();
  }

  void setInsertAccess(bool value) {
    hasInsertAccess = value;
    notifyListeners();
  }

  void setUpdateAccess(bool value) {
    hasUpdateAccess = value;
    notifyListeners();
  }

  void setDeleteAccess(bool value) {
    hasDeleteAccess = value;
    notifyListeners();
  }

  void onChanged(String value) async {
    // For filtered data
    String org = await prefUtils.getOrgValue('orgid');

    if (value == 'Active') {
      await _repository.userData(
        formData: {
          'operation': 'get_user_data',
          'access_token': 'developer_bypass',
          'org_id': org,
          'status': '1'
        },
      ).then((value) async {
        model = value;
        if (model.sTATUS != "ERROR") {
          notifyListeners();
        } else {
          showError(model.errorDescription ?? '');
        }
      });
    } else if (value == 'In-Active') {
      await _repository.userData(
        formData: {
          'operation': 'get_user_data',
          'access_token': 'developer_bypass',
          'org_id': org,
          'status': '0'
        },
      ).then((value) async {
        model = value;
        if (model.sTATUS != "ERROR") {
          notifyListeners();
        } else {
          showError(model.errorDescription ?? '');
        }
      });
    } else {
      await _repository.userData(
        formData: {
          'operation': 'get_user_data',
          'access_token': 'developer_bypass',
          'org_id': org,
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
    notifyListeners();
  }

  void onSelectedChipView(int index, bool value) {
    userModelObj.actionsItemList.forEach((element) {
      element.isSelected = false;
    });
    userModelObj.actionsItemList[index].isSelected = value;
    notifyListeners();
  }
}
