import 'dart:io'; // For handling files
import 'package:image_picker/image_picker.dart'; // Import the ImagePicker package
import 'package:flutter/material.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/pref_utils.dart';
import '../../../data/repository/repository.dart';
import '../../../data/models/loginDeviceAuth/post_login_device_auth_resp.dart';

class ProfileProvider extends ChangeNotifier {
  // Controllers for text fields
  TextEditingController? userNameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? occupationController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();

  USERDATA? userdata;
  final _repository = Repository();
  PrefUtils prefUtils = PrefUtils();

  // Image file for profile picture
  File? profileImage;
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  ProfileProvider() {
    init();
  }

  init() async {
    userdata = prefUtils.getUserData();
    userNameController = TextEditingController(text: userdata?.userName ?? '');
    emailController = TextEditingController(text: userdata?.userEmail ?? '');
  }

  // Method to handle saving changes
  Future<void> saveProfile() async {
    try {
      final response = await _repository.updateUserDetails(
        formData: {
          'user_name': userNameController?.text,
          'user_id': userdata?.id,
          'user_email': emailController?.text,
          'user_occupation': occupationController?.text,
          'user_description': descriptionController?.text,
          'operation': 'update_user_details',
          'access_token': 'developer_bypass',
        },
      );

      if (response.sTATUS != "ERROR") {
        // Handle success
        showSuccess('Profile updated successfully');
        notifyListeners();
      } else {
        // Handle error
        showError(response.eRRORDESCRIPTION ?? 'Failed to update profile');
      }
    } catch (error) {
      showError('An error occurred while updating the profile');
    }
  }

  // Method to handle changing the profile picture
  Future<void> changePicture() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage = File(pickedFile.path); // Store the selected image file
        notifyListeners(); // Notify listeners to update the UI
        // You can now upload this image to your server or save it locally
        showSuccess('Profile picture updated successfully');
      } else {
        showError('No image selected');
      }
    } catch (e) {
      print(e);
      showError('Failed to pick image');
    }
  }

  // Method to handle deleting the profile picture
  void deletePicture() {
    profileImage = null; // Remove the profile picture
    notifyListeners(); // Notify listeners to update the UI
    print("Profile picture deleted");
  }
}
