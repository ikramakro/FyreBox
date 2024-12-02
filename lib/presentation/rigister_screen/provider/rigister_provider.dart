import 'dart:async';
import 'package:fyrebox/core/utils/constant.dart';
import 'package:fyrebox/data/models/org_type.dart';
import 'package:fyrebox/data/models/selectionPopupModel/selection_popup_model.dart';
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

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  FutureOr<void> callLoginDeviceAuth({
    Function? onSuccess,
    Function? onError,
  }) async {
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

        onSuccess!.call();
        notifyListeners();
      } else {
        showError(postLoginDeviceAuthResp.eRRORDESCRIPTION ?? '');
        // notifyListeners();
      }
    });
  }

  FutureOr<void> loadDashboardData({
    Function? onSuccess,
    Function? onError,
  }) async {
    await _repository.orgType(
      formData: {
        'operation': 'get_org_types',
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
