import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // Controllers for text fields
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Method to handle saving changes
  void saveProfile() {
    // Here you would handle saving the profile data
    // This might involve making an API call or saving data locally
    print("Profile Saved");
    notifyListeners();
  }

  // Method to handle changing the profile picture
  void changePicture() {
    // Logic for changing the profile picture
    print("Change Picture");
  }

  // Method to handle deleting the profile picture
  void deletePicture() {
    // Logic for deleting the profile picture
    print("Delete Picture");
  }
}