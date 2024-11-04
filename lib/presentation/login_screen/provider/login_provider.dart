import 'dart:async';
import 'package:fyrebox/core/utils/constant.dart';
import 'package:fyrebox/core/utils/shared_prf.dart';
import '../../../core/app_export.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';
// import '../models/login_model.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // LoginModel loginModelObj = LoginModel();
  bool isShowPassword = true;
  final _repository = Repository();
  var postLoginDeviceAuthResp = AuthResponse();

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
    await _repository.login(
      formData: {
        'operation': 'user_login_form',
        'user_email': userNameController.text,
        'user_password': passwordController.text
      },
    ).then((value) async {
      postLoginDeviceAuthResp = value;
      if (postLoginDeviceAuthResp.status != "ERROR") {
        PrefUtils prefUtils = PrefUtils();
        await prefUtils
            .setUserData(postLoginDeviceAuthResp.userData ?? USERDATA());
        await prefUtils.setAccessToken(postLoginDeviceAuthResp.jwt ?? '');

        onSuccess!.call();
        notifyListeners();
      } else {
        showError(postLoginDeviceAuthResp.errorDescription ?? '');
        // notifyListeners();
      }
    });
  }
}
