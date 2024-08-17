import 'package:flutter/material.dart';
import 'package:fyrebox/presentation/setting/profile/profile_provider.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';// Import your custom button

class ProfileScreen extends StatelessWidget {
 Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child:  ProfileScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
          
            const SizedBox(height: 16.0),
            // Profile Picture Section
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Replace with actual image
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomElevatedButton(
                        onPressed: () {
                          // Handle change picture
                        },
                        text: 'Change Picture',
                        buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      CustomElevatedButton(
                        onPressed: () {
                          // Handle delete picture
                        },
                        text: 'Delete',
                        buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            // User Name
            const Text(
              'User Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter your user name',
            ),
            const SizedBox(height: 16.0),
            // First Name
            const Text(
              'First Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter your first name',
            ),
            const SizedBox(height: 16.0),
            // Email
            const Text(
              'Your Email',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 16.0),
            // Occupation
            const Text(
              'Occupation',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter your occupation',
            ),
            const SizedBox(height: 16.0),
            // Description
            const Text(
              'Description',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const CustomTextFormField1(
              hintText: 'Enter a description about yourself',
              maxLines: 5, // Allows for multiline input
            ),
            const SizedBox(height: 24.0),
            // Save Button
            Center(
              child: CustomElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                text: 'Save Changes',
                buttonStyle: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0)),
                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
