import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fyrebox/core/utils/progress_dialog_utils.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_prf.dart';
import '../../../data/models/device_model.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/models/user_data_model.dart';
import '../../../data/repository/repository.dart';
import '../models/device_model.dart';

class DeviceProvider extends ChangeNotifier {
  DeviceModel deviceModelObj = DeviceModel();

  DeviceResponse model = DeviceResponse();
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

  DeviceProvider() {
    init();
  }

  init() async {
    await loadDashboardData();
  }

  void downloadFile() async {
    // Create an instance of Dio
    var token = PrefUtils().getAccessToken();
    Dio dio = Dio();

    // URL for file download
    String url =
        'https://fyreboxhub.com/api/export_device_checklists.php?access_token=$token';
    print(
        'https://fyreboxhub.com/api/export_device_checklists.php?access_token=$token');
    // Get the directory to save the downloaded file
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/export_device_checklists.csv';

    try {
      // Download the file
      ProgressDialogUtils.showProgressDialog();
      await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          print("${(received / total * 100).toStringAsFixed(0)}%");
        }
      });
      ProgressDialogUtils.hideProgressDialog();
      print("Download completed! File saved at $filePath");
      showSuccess("Download completed! File saved at $filePath");
    } catch (e) {
      print("Error: $e");
      showError("Error: $e");
    }
  }

  void setDeviceType(String type) {
    selectedType = type;
    notifyListeners();
  }

  void setMfrDate(String date) {
    mfrDateController.text = date;
    notifyListeners();
  }

  FutureOr<void> orderDevice() async {
    USERDATA userdata = prefUtils.getUserData()!;
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

  FutureOr<void> addDevice() async {
    USERDATA userdata = prefUtils.getUserData()!;
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

  Future<void> deleteDevice(String deviceId) async {
    await _repository.addDevice(
      formData: {
        'operation': 'delete_device',
        'device_id': deviceId,
        // 'access_token': 'developer_bypass',
      },
    ).then((value) {
      if (value.sTATUS != "ERROR") {
        // Remove the device from the list
        model.dbData?.removeWhere((device) => device.id.toString() == deviceId);

        // Notify the listeners to rebuild the UI
        notifyListeners();

        showSuccess('Device deleted successfully');
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Failed to delete device');
      }
    }).catchError((error) {
      showError('An error occurred while deleting the device');
    });
  }

  Future<void> updateDevice(String deviceId) async {
    USERDATA userdata = prefUtils.getUserData()!;
    await _repository.addDevice(
      formData: {
        'operation':
            'update_device', // Assuming the backend operation is called 'update_device'
        'device_id': deviceId,
        'device_type': deviceTypeController.text,
        'device_location': deviceLocationController.text,
      },
    ).then((value) async {
      if (value.sTATUS != "ERROR") {
        showSuccess('Device updated successfully');
        // Fetch updated device data
        await loadDashboardData();
        notifyListeners();
      } else {
        showError(value.eRRORDESCRIPTION ?? 'Failed to update device');
      }
    }).catchError((error) {
      showError('An error occurred while updating the device');
    });
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

    await _repository.deviceData(
      formData: {
        'operation': 'get_devices',
        'access_token': 'developer_bypass',
        'org_id': userdata.orgId
      },
    ).then((value) async {
      model = value;
      if (model.status != "ERROR") {
        notifyListeners();
      } else {
        showError(model.errorDescription ?? '');
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

  void setOrderDeviceType(String? type) {
    selectedDeviceType = type;
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
    String org = prefUtils.getOrgValue('orgid');

    if (value == 'Active') {
      await _repository.deviceData(
        formData: {
          'operation': 'get_devices',
          'access_token': 'developer_bypass',
          'org_id': org,
          'status': '1'
        },
      ).then((value) async {
        model = value;
        if (model.status != "ERROR") {
          notifyListeners();
        } else {
          showError(model.errorDescription ?? '');
        }
      });
    } else if (value == 'In-Active') {
      await _repository.deviceData(
        formData: {
          'operation': 'get_devices',
          'access_token': 'developer_bypass',
          'org_id': org,
          'status': '0'
        },
      ).then((value) async {
        model = value;
        if (model.status != "ERROR") {
          notifyListeners();
        } else {
          showError(model.errorDescription ?? '');
        }
      });
    } else {
      await _repository.deviceData(
        formData: {
          'operation': 'get_devices',
          'access_token': 'developer_bypass',
          'org_id': org,
        },
      ).then((value) async {
        model = value;
        if (model.status != "ERROR") {
          notifyListeners();
        } else {
          showError(model.errorDescription ?? '');
        }
      });
    }
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
