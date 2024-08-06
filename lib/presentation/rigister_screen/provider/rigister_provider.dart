import 'dart:async';
import 'package:fyrebox/core/utils/constant.dart';
import '../../../core/app_export.dart';
// import '../../../data/models/base_model';
import '../../../data/models/base_model.dart';
import '../../../data/repository/repository.dart';
// import '../models/login_model.dart';

class RigisterProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // LoginModel loginModelObj = LoginModel();
  bool isShowPassword = true;
  final _repository = Repository();
  var postLoginDeviceAuthResp = BaseModel();
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
        'operation': 'register_client'
      },
    ).then((value) async {
      // postLoginDeviceAuthResp = value;
      if (postLoginDeviceAuthResp.sTATUS != "ERROR") {
        PrefUtils prefUtils = PrefUtils();

        await prefUtils.setBoolValue('isLogin', true);

        onSuccess!.call();
        notifyListeners();
      } else {
        showError(postLoginDeviceAuthResp.eRRORDESCRIPTION ?? '');
        // notifyListeners();
      }
    });
  }
}
