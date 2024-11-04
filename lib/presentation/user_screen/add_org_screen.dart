import 'package:flutter_switch/flutter_switch.dart';
import 'package:fyrebox/core/app_export.dart';
import 'package:fyrebox/widgets/custom_text_form_field1.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_radio_button.dart';
import 'provider/user_provider.dart'; // Assuming you have this widget

class AddOrganizationUserScreen extends StatefulWidget {
  const AddOrganizationUserScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddOrganizationUserScreenState createState() =>
      _AddOrganizationUserScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const AddOrganizationUserScreen(),
    );
  }
}

class _AddOrganizationUserScreenState extends State<AddOrganizationUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Organization User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<UserProvider>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField1(
                  controller: provider.userNameController,
                  hintText: 'User Name',
                ),
                const SizedBox(height: 16.0),
                const Text('Organization Owner:',
                    style: TextStyle(fontSize: 16.0)),
                Row(
                  children: [
                    Checkbox(
                      value: provider.isOrganizationOwner,
                      onChanged: (bool? newValue) {
                        provider.setOrganizationOwner(newValue ?? false);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text('Is Organization Owner'),
                  ],
                ),
                CustomTextFormField1(
                  controller: provider.emailController,
                  hintText: 'Email Address',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                CustomDropDown(
                  hintText: '-- Select User Role --',
                  items: provider.userModelObj.roleDropdownItemList,
                  onChanged: (value) {
                    provider.setUserRole(value.title);
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Permissions',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16.0),
                _buildPermissionSwitch('Full Access', provider.hasFullAccess,
                    (value) {
                  provider.setFullAccess(value);
                }),
                const SizedBox(height: 16.0),
                _buildPermissionSwitch(
                    'Insert Access', provider.hasInsertAccess, (value) {
                  provider.setInsertAccess(value);
                }),
                const SizedBox(height: 16.0),
                _buildPermissionSwitch(
                    'Update Access', provider.hasUpdateAccess, (value) {
                  provider.setUpdateAccess(value);
                }),
                const SizedBox(height: 16.0),
                _buildPermissionSwitch(
                    'Delete Access', provider.hasDeleteAccess, (value) {
                  provider.setDeleteAccess(value);
                }),
                const SizedBox(height: 24.0),
                CustomElevatedButton(
                  buttonStyle: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(appTheme.deepOrangeA100)),
                  onPressed: () {
                    provider.addUser();
                  },
                  text: 'Add User',
                  height: 50,
                  width: double.infinity,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPermissionSwitch(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        FlutterSwitch(
            height: 20.0,
            width: 35.0,
            padding: 4.0,
            toggleSize: 15.0,
            borderRadius: 10.0,
            activeColor: appTheme.deepOrangeA100,
            value: value,
            onToggle: onChanged),
      ],
    );
  }
}

class SelectionPopupModel {
  final String title;

  SelectionPopupModel({required this.title});
}
