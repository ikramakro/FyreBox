import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';
import '../profile/profile_provider.dart'; // Import your custom button

class ChangePasswordScreen extends StatelessWidget {
  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: ChangePasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 24.0),
            // Old Password
            const Text(
              'Old Password',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter your old password',
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            // New Password
            const Text(
              'New Password',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter your new password',
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            // Re-type New Password
            const Text(
              'Re-type New Password',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Re-type your new password',
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            // Save Button
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  // Handle change password action
                },
                text: 'Change Password',
                buttonStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}