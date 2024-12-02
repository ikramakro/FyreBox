import 'dart:async';
import 'package:fyrebox/data/models/device_type.dart';
import 'package:fyrebox/data/models/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';
import '../models/device_model.dart';

class AddDeviceProvider extends ChangeNotifier {
  DeviceModel deviceModelObj = DeviceModel();

  DeviceTypeResponse model = DeviceTypeResponse();
  final _repository = Repository();
  LocalStorageService sp = LocalStorageService();
  PrefUtils prefUtils = PrefUtils();
  String? selectedType;
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController siteNameController = TextEditingController();
  final TextEditingController deviceLocationController =
      TextEditingController();
  final TextEditingController mfrNameController = TextEditingController();
  final TextEditingController mfrContactController = TextEditingController();
  final TextEditingController mfrEmailController = TextEditingController();
  final TextEditingController mfrDateController = TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController deviceTypeController = TextEditingController();
  final TextEditingController deviceLocationController1 =
      TextEditingController();

  bool isOrganizationOwner = false;
  String? selectedUserRole;
  bool hasFullAccess = false;
  bool hasInsertAccess = false;
  bool hasUpdateAccess = false;
  bool hasDeleteAccess = false;
  String? selectedDeviceType;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedDevice;

  AddDeviceProvider() {
    init();
  }

  init() async {
    await loadDashboardData();
    selectedDevice = '';
  }

  void setDeviceType(String type, String name) {
    selectedType = type;
    selectedDevice = name;
    notifyListeners();
  }

  void setMfrDate(String date) {
    mfrDateController.text = date;
    notifyListeners();
  }

  FutureOr<void> orderDevice() async {
    if (selectedDevice!.contains('under development')) {
      showError('This device type is under development.');
      return;
    } else {
      await _repository.orderDevice(
        formData: {
          'device_type': selectedDeviceType,
          'device_quantity': quantityController.text,
          'device_description': descriptionController.text,
          'operation': 'order_device',
          'access_token': 'developer_bypass',
        },
      ).then((value) async {
        if (value.sTATUS != "ERROR") {
          showSuccess(value.dESCRIPTION ?? '');
          NavigatorService.popAndPushNamed(AppRoutes.rootScreen, arguments: 0);
          notifyListeners();
        } else {
          showError(value.eRRORDESCRIPTION ?? '');
        }
      });
    }
  }

  FutureOr<void> addDevice() async {
    USERDATA userdata = prefUtils.getUserData()!;
    print('======== $selectedType');
    if (selectedDevice!.contains('under development')) {
      showError('This device type is under development.');
      return;
    } else {
      await _repository.addDevice(
        formData: {
          'org_id': userdata.orgId,
          'device_name': deviceNameController.text,
          'device_type': "2",
          'device_cite_name': siteNameController.text,
          'device_location': deviceLocationController.text,
          'manufacturer_name': mfrNameController.text,
          'manufacturer_contact': mfrContactController.text,
          'manufacturer_email': mfrEmailController.text,
          'manufacturer_date': mfrDateController.text,
          'serial_number': serialNumberController.text,
          'operation': 'add_device',
          'access_token': 'developer_bypass',
        },
      ).then((value) async {
        if (value.sTATUS != "ERROR") {
          showSuccess(value.dESCRIPTION ?? '');
          NavigatorService.popAndPushNamed(AppRoutes.rootScreen, arguments: 0);
          notifyListeners();
        } else {
          showError(value.eRRORDESCRIPTION ?? '');
        }
      });
    }
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
    await _repository.deviceType(
      formData: {
        'operation': 'get_device_types',
      },
    ).then((value) async {
      model = value;
      if (model.sTATUS != "ERROR") {
        // Parse data into deviceTypeDropdownItemList
        deviceModelObj.deviceTypeDropdownItemList = model.dBDATA
                ?.map((data) => SelectionPopupModel(
                      id: data.id,
                      title: data.deviceTypeName ?? "",
                    ))
                .toList() ??
            [];
        deviceModelObj.orderdeviceTypeDropdownItemList = model.dBDATA
                ?.map((data) => SelectionPopupModel(
                      id: data.id,
                      title: data.deviceTypeName ?? "",
                    ))
                .toList() ??
            [];
        notifyListeners();
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        showError(model.errorDescription ?? '');
        if (onError != null) {
          onError(model.errorDescription ?? '');
        }
      }
    });
  }

  onSelected(dynamic value) {
    for (var element in deviceModelObj.dropdownItemList) {
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

  void setOrderDeviceType(String? type, String? name) {
    selectedDeviceType = type;

    selectedDevice = name;
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

  void onSelectedChipView(int index, bool value) {
    for (var element in deviceModelObj.actionsItemList) {
      element.isSelected = false;
    }
    deviceModelObj.actionsItemList[index].isSelected = value;
    notifyListeners();
  }
}
