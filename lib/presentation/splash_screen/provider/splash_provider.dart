import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../../data/repository/repository.dart';

class SplashProvider extends ChangeNotifier {
  final _repository = Repository();
  PrefUtils prefUtils = PrefUtils();
  
  SplashProvider() {
    // Initialization moved to a method that will be called after screen render
  }

  
}
