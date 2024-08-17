import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';
import '../profile/profile_provider.dart';

class ContactInfoScreen extends StatelessWidget {
   
   
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: ContactInfoScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Info'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16.0),
            // Phone No.
            const Text(
              'Phone No.:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter phone number',
            ),
            const SizedBox(height: 16.0),
            // Phone
            const Text(
              'Phone:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter alternative phone number',
            ),
            const SizedBox(height: 16.0),
            // Website
            const Text(
              'Website:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter website URL',
            ),
            const SizedBox(height: 16.0),
            // Url
            const Text(
              'Url:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter additional URL',
            ),
            const SizedBox(height: 24.0),
            // Add Info Button
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  // Handle add info action
                },
                text: 'Add Info',
                buttonStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}