import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../profile/profile_provider.dart';

class OrganizationScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: OrganizationScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Organization Logo Section
            const Text(
              'Organization Logo:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text(
                    'No file chosen',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            CustomElevatedButton(
              onPressed: () {
                // Handle logo upload action
              },
              text: 'Choose File',
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Organization Map Section
            const Text(
              'Organization Map:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text(
                    'No file chosen',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            CustomElevatedButton(
              onPressed: () {
                // Handle map upload action
              },
              text: 'Choose File',
              buttonStyle: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueGrey),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}