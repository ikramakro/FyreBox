import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/edit_model.dart';

class EditProvider extends ChangeNotifier {
  TextEditingController edittextController = TextEditingController();
  EditModel editModelObj = EditModel();
  bool englishkeyTwo = false;
  bool englishkeytwo = false;
  String radioGroup = "";
  @override
  void dispose() {
    super.dispose();
    edittextController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in editModelObj.dropdownItemList) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    notifyListeners();
  }

  void changeCheckBox(bool value) {
    englishkeyTwo = value;
    notifyListeners();
  }

  void changeCheckBox1(bool value) {
    englishkeytwo = value;
    notifyListeners();
  }

  void changeRadioButton(String value) {
    radioGroup = value;
    notifyListeners();
  }
}
