import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fyrebox/core/utils/constant.dart';
import 'package:fyrebox/core/utils/progress_dialog_utils.dart';
import 'package:fyrebox/data/models/org_type.dart';
import 'package:fyrebox/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';
// import '../../../data/models/base_model';
import '../../../data/models/base_model.dart';
import '../../../data/repository/repository.dart';
// import '../models/login_model.dart';

class RigisterProvider extends ChangeNotifier {
  OrgType orgtype = OrgType();
  List<SelectionPopupModel> orgTypeDropdownItemList = [];
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController orgnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final Dio dio = Dio();
  TextEditingController phoneController = TextEditingController();

  TextEditingController vatController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool term = false;

  String? organizationLogo;
  String? evacuationMapImage;

  final ImagePicker _imagePicker = ImagePicker();

  String? selectedOrgType;
  // LoginModel loginModelObj = LoginModel();
  bool isShowPassword = true;
  final _repository = Repository();
  var postLoginDeviceAuthResp = BaseModel();
  RigisterProvider() {
    init();
  }
  init() async {
    await loadDashboardData();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  setterm() {
    term = !term;
    notifyListeners();
  }

  void onChanged(String newValue) {
    selectedOrgType = newValue;
    notifyListeners();
  }

  Future<void> pickImageForLogo() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      organizationLogo = pickedFile.path;
      notifyListeners();
    }
  }

  Future<void> pickImageForMap() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      evacuationMapImage = pickedFile.path;
      notifyListeners();
    }
  }
//  Future<void> uploadMap() async {
//     if (_map == null) return;
//     String? accessToken = PrefUtils().getAccessToken();
//     _isUploadingMap = true;
//     notifyListeners(); // Notify listeners to show loading indicator

  // final url =
  //     'https://fyreboxhub.com/api/set_data.php?operation=update_organization_logo&access_token=$accessToken';

//     try {
//       FormData formData = FormData.fromMap({
//         'org_map': await MultipartFile.fromFile(
//           _map!.path,
//         ),
//       });

//       Response response = await dio.post(url, data: formData);

  // if (response.statusCode == 200) {
  //   print('Map uploaded successfully');
  //   if (response.data['STATUS'] == 'ERROR') {
  //     showError(response.data['ERROR_DESCRIPTION']);
  //   } else {
  //     showSuccess('Successfully uploaded');
  //   }
  // } else {
  //   print('Failed to upload map');
  // }
//     } catch (e) {
//       print('Error uploading map: $e');
//     } finally {
//       _isUploadingMap = false;
//       notifyListeners(); // Notify listeners to hide loading indicator
//     }
//   }

  Future<void> registerOrganization() async {
    try {
      ProgressDialogUtils.showProgressDialog();
      String? accessToken = PrefUtils().getAccessToken();
      final url =
          'https://fyreboxhub.com/api/set_data.php?operation=update_organization_logo&access_token=$accessToken';

      // Creating the base form data
      final formData = FormData.fromMap({
        'org_name': orgnameController.text,
        'org_email': userNameController.text,
        'org_phone': phoneController.text,
        'org_type': selectedOrgType,
        'org_vat': vatController.text,
        'org_address': addressController.text,
        'operation': 'register_organization',
        // Adding organization logo
        'org_logo': await MultipartFile.fromFile(
          organizationLogo!,
          filename: 'org_logo_${DateTime.now().millisecondsSinceEpoch}.png',
        ),
        // Adding evacuation map
        'org_evacuation_map': await MultipartFile.fromFile(
          evacuationMapImage!,
          filename: 'org_map_${DateTime.now().millisecondsSinceEpoch}.png',
        ),
      });

      // Making the API call
      Response response = await dio.post(url, data: formData);
      ProgressDialogUtils.hideProgressDialog();
      // Checking for success or error
      if (response.statusCode == 200) {
        print('Map uploaded successfully');
        if (response.data['STATUS'] == 'ERROR') {
          showError(response.data['ERROR_DESCRIPTION']);
        } else {
          showSuccess('Successfully uploaded');
          NavigatorService.pushNamed(AppRoutes.loginScreen);
        }
      } else {
        print('Failed to upload map');
      }
    } catch (e) {
      // Handle exceptions
      print("Registration failed: $e");
    }
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  FutureOr<void> callLoginDeviceAuth() async {
    if (term) {
      await _repository.register(
        formData: {
          'client_name': nameController.text,
          'client_email': userNameController.text,
          'client_password': passwordController.text,
          'client_re_password': confirmPasswordController.text,
          'operation': 'register_client',
          'client_terms_and_condition': ''
        },
      ).then((value) async {
        // postLoginDeviceAuthResp = value;
        if (postLoginDeviceAuthResp.sTATUS != "ERROR") {
          // PrefUtils prefUtils = PrefUtils();

          // await prefUtils.setBoolValue('isLogin', true);

          NavigatorService.pushNamed(AppRoutes.registerOrganizationScreen,
              arguments: userNameController.text);
          notifyListeners();
        } else {
          showError(postLoginDeviceAuthResp.eRRORDESCRIPTION ?? '');
          // notifyListeners();
        }
      });
    } else {
      showError('Please accept the terms and conditions');
    }
  }

  FutureOr<void> loadDashboardData({
    Function? onSuccess,
    Function? onError,
  }) async {
    await _repository.orgType(
      formData: {
        'operation': 'get_org_types',
        'access_token': 'developer_bypass',
      },
    ).then((value) async {
      orgtype = value;
      if (orgtype.sTATUS != "ERROR") {
        // Parse data into deviceTypeDropdownItemList
        orgTypeDropdownItemList = orgtype.dBDATA
                ?.map((data) => SelectionPopupModel(
                      id: data.id,
                      title: data.name ?? "",
                    ))
                .toList() ??
            [];

        notifyListeners();
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        showError(orgtype.errorDescription ?? '');
        if (onError != null) {
          onError(orgtype.errorDescription ?? '');
        }
      }
    });
  }
}
