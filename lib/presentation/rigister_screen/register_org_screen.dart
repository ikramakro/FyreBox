import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field1.dart';

class RegisterOrganizationScreen extends StatefulWidget {
  const RegisterOrganizationScreen({super.key});

  @override
  _RegisterOrganizationScreenState createState() =>
      _RegisterOrganizationScreenState();
}

class _RegisterOrganizationScreenState
    extends State<RegisterOrganizationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(text: "ikr@gmail.com");
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController vatController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? selectedOrgType;
  String? logoFileName = 'No file chosen';
  String? evacMapFileName = 'No file chosen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Organization'),
        backgroundColor: const Color(0xffd61a21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Organization's Name:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: nameController,
                hintText: "Enter organization's name",
                borderDecoration: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Email Address:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: emailController,
                hintText: 'Enter email address',
                // keyboardType: TextInputType.emailAddress,
                borderDecoration: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Phone Number:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: phoneController,
                hintText: 'Enter phone number',
                // keyboardType: TextInputType.phone,
                borderDecoration: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Type:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              CustomDropDown(
                hintText: '-- Select Organization Type --',
                items: [
                  SelectionPopupModel(id: 1, title: 'Private'),
                  SelectionPopupModel(id: 2, title: 'Public'),
                  SelectionPopupModel(id: 3, title: 'Non-Profit'),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedOrgType = value.title;
                  });
                },
                borderDecoration: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'VAT Number:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: vatController,
                hintText: 'Enter VAT number',
                borderDecoration: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Logo:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle file picker here
                      setState(() {
                        logoFileName = 'Selected logo file';
                      });
                    },
                    child: const Text('Choose File'),
                  ),
                  const SizedBox(width: 8.0),
                  Text(logoFileName ?? 'No file chosen'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Evacuation Map:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle file picker here
                      setState(() {
                        evacMapFileName = 'Selected evacuation map file';
                      });
                    },
                    child: const Text('Choose File'),
                  ),
                  const SizedBox(width: 8.0),
                  Text(evacMapFileName ?? 'No file chosen'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Address:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: addressController,
                hintText: 'Enter address',
                borderDecoration: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: CustomElevatedButton(
                  text: 'Sign in',
                  onPressed: () {
                    // Handle sign in action
                  },
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
      ),
    );
  }
}
