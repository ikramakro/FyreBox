import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fyrebox/core/app_export.dart';
import 'package:fyrebox/widgets/custom_text_form_field1.dart';
import 'package:intl/intl.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/device_provider.dart'; // Assuming you have this widget

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviceProvider(),
      child: const AddDeviceScreen(),
    );
  }
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<DeviceProvider>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropDown(
                  hintText: '-- Select Device Type --',
                  items: provider.deviceModelObj.deviceTypeDropdownItemList,
                  onChanged: (value) {
                    provider.setDeviceType(value.title);
                  },
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.deviceNameController,
                  hintText: 'Device Name',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.siteNameController,
                  hintText: 'Site Name',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.deviceLocationController,
                  hintText: 'Device Location',
                ),
                const SizedBox(height: 24.0),
                const Text('Manufacturer Details',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.mfrNameController,
                  hintText: 'Name',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.mfrContactController,
                  hintText: 'Contact',
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.mfrEmailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      provider.setMfrDate(
                          DateFormat('MM/dd/yyyy').format(pickedDate));
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomTextFormField1(
                      controller: provider.mfrDateController,
                      hintText: 'Date Of Manufacture: mm/dd/yyyy',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField1(
                  controller: provider.serialNumberController,
                  hintText: 'Serial Number',
                ),
                const SizedBox(height: 24.0),
                CustomElevatedButton(
                  buttonStyle: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(appTheme.deepOrangeA100)),
                  onPressed: () {
                    // provider.addDevice();
                  },
                  text: 'Add Device',
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
}

class SelectionPopupModel {
  final String title;

  SelectionPopupModel({required this.title});
}
