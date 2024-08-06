import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
// import '../models/privacy_model.dart';

class PrivacyProvider extends ChangeNotifier {
  // PrivacyModel privacyModelObj = PrivacyModel();
  bool acceptanceCheckbox = false;
  @override
  void dispose() {
    super.dispose();
  }

  void changeCheckBox(bool value) {
    acceptanceCheckbox = value;
    notifyListeners();
  }
}
