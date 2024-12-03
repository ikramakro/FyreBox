import 'package:fyrebox/core/app_export.dart';
import 'package:fyrebox/core/utils/constant.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';
import 'organization_provider.dart';

class OrganizationNameScreen extends StatelessWidget {
  const OrganizationNameScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrganizationNameProvider(),
      child: const OrganizationNameScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrganizationNameProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          backgroundColor: const Color(0xffd61a21),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<OrganizationNameProvider>(
              builder: (context, provider, child) {
            provider.oldPasswordController =
                TextEditingController(text: dbData?.orgName ?? '');
            return ListView(
              children: [
                Center(
                    child: CustomImageView(
                  imagePath:
                      'https://fyreboxhub.com/assets/images/${dbData?.orgLogo ?? ''}',
                  height: 212.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 16.h),
                  fit: BoxFit.contain,
                )),
                const SizedBox(height: 24.0),
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField1(
                  controller: provider.oldPasswordController,
                  hintText: 'Enter your old password',
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Password',
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
                const SizedBox(height: 24.0),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                      provider
                          .changePassword(); // Handle change password action
                    },
                    text: 'Change ',
                    buttonStyle: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xffd61a21)),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0)),
                      textStyle: WidgetStateProperty.all(
                          const TextStyle(fontSize: 16.0)),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
