import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/constant.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field1.dart';
import 'profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        backgroundColor: const Color(0xffd61a21),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: provider.profileImage != null
                          ? FileImage(provider.profileImage!)
                          : NetworkImage(
                              'https://fyreboxhub.com/assets/images/${dbData?.orgLogo ?? ''}',
                            ) as ImageProvider,
                    ),
                    Positioned(
                      top: 50,
                      left: 55,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.black),
                        onPressed: () {
                          provider.changePicture(); // Trigger the image picker
                        },
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'User Name',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: provider.userNameController,
                hintText: 'Enter your user name',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Your Email',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: provider.emailController,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Occupation',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: provider.occupationController,
                hintText: 'Enter your occupation',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField1(
                controller: provider.descriptionController,
                hintText: 'Enter a description about yourself',
                maxLines: 5,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: CustomElevatedButton(
                  onPressed: () async {
                    await provider.saveProfile(); // Save action
                    Navigator.of(context).pop();
                  },
                  text: 'Save Changes',
                  buttonStyle: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0xffd61a21)),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                    ),
                    textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 16.0)),
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
