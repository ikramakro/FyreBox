import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';
import '../../core/app_export.dart';
import 'provider/vistor_provider.dart';

class AddVisitorScreen extends StatefulWidget {
  const AddVisitorScreen({super.key});

  @override
  _AddVisitorScreenState createState() => _AddVisitorScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VisitorProvider(),
      child: const AddVisitorScreen(),
    );
  }
}

class _AddVisitorScreenState extends State<AddVisitorScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Visitor'),
        backgroundColor: const Color(0xffd61a21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 24.0),
            const Text(
              'Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            CustomTextFormField1(
              controller: nameController,
              hintText: 'Enter visitor\'s name',
              borderDecoration: const OutlineInputBorder(),
              // //contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Surname',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            CustomTextFormField1(
              controller: surnameController,
              hintText: 'Enter visitor\'s surname',
              borderDecoration: const OutlineInputBorder(),
              //contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Visitor\'s Email',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            CustomTextFormField1(
              controller: emailController,
              hintText: 'Enter visitor\'s email',
              borderDecoration: const OutlineInputBorder(),
              //contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Visitor\'s Phone',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            CustomTextFormField1(
              controller: phoneController,
              hintText: 'Enter visitor\'s phone',
              borderDecoration: const OutlineInputBorder(),
              //contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Status',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Active'),
                FlutterSwitch(
                  height: 30.0,
                  width: 60.0,
                  padding: 4.0,
                  toggleSize: 20.0,
                  borderRadius: 15.0,
                  activeColor: const Color(0xffd61a21),
                  value: isActive,
                  onToggle: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                ),
                const Text('Inactive'),
              ],
            ),
            const SizedBox(height: 24.0),
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                text: 'Add Visitor',
                buttonStyle: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                  backgroundColor: const Color(0xffd61a21),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
