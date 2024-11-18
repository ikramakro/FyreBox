import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';
import 'change_password_provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangePasswordProvider(),
      child: const ChangePasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangePasswordProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          backgroundColor: const Color(0xffd61a21),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ChangePasswordProvider>(
            builder: (context, provider, child) => ListView(
              children: [
                const SizedBox(height: 24.0),
                const Text(
                  'Old Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField1(
                  controller: provider.oldPasswordController,
                  hintText: 'Enter your old password',
                  obscureText: !provider.isOldPasswordVisible,
                  suffix: IconButton(
                    icon: Icon(provider.isOldPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: provider.toggleOldPasswordVisibility,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'New Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField1(
                  controller: provider.newPasswordController,
                  hintText: 'Enter your new password',
                  obscureText: !provider.isNewPasswordVisible,
                  suffix: IconButton(
                    icon: Icon(provider.isNewPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: provider.toggleNewPasswordVisibility,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Re-type New Password',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField1(
                  controller: provider.retypePasswordController,
                  hintText: 'Re-type your new password',
                  obscureText: !provider.isRetypePasswordVisible,
                  suffix: IconButton(
                    icon: Icon(provider.isRetypePasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: provider.toggleRetypePasswordVisibility,
                  ),
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                      provider
                          .changePassword(); // Handle change password action
                    },
                    text: 'Change Password',
                    buttonStyle: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xffd61a21)),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 12.0)),
                      textStyle: WidgetStateProperty.all(
                          const TextStyle(fontSize: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
