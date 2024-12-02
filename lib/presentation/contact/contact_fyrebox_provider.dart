import 'package:flutter/material.dart';
import 'package:fyrebox/core/utils/pref_utils.dart';

import '../../core/utils/constant.dart';
import '../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../data/repository/repository.dart';

class ContactFyreBoxProvider extends ChangeNotifier {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedPriority;
  final _repository = Repository();
  PrefUtils prefUtils = PrefUtils();
  USERDATA? userdata;
  List<SelectionPopupModel> itemlist = [
    SelectionPopupModel(id: 1, title: 'High'),
    SelectionPopupModel(id: 2, title: 'Medium'),
    SelectionPopupModel(id: 3, title: 'Low'),
  ];
  ContactFyreBoxProvider() {
    init();
  }

  void init() async {
    userdata = prefUtils.getUserData();
  }

  void setPriority(String priority) {
    selectedPriority = priority;
    notifyListeners();
  }

  Future<void> submitContactForm() async {
    try {
      final response = await _repository.contactFyreBox(
        formData: {
          'contact_subject': subjectController.text,
          'contact_priority': selectedPriority,
          'contact_description': descriptionController.text,
          'operation': 'contact_fyrebox',
          // 'access_token': 'developer_bypass',
          'org_id': userdata?.orgId ?? ''
        },
      );
      if (response.sTATUS != "ERROR") {
        // Handle success
        showSuccess('Form submitted successfully');
        notifyListeners();
      } else {
        // Handle error
        showError(response.eRRORDESCRIPTION ?? 'Failed to submit form');
      }
    } catch (error) {
      showError('An error occurred while submitting the form');
    }
  }
}
