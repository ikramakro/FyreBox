import 'package:fyrebox/core/app_export.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personal Details'),
            onTap: () {
              NavigatorService.pushNamed(AppRoutes.settingScreen);
            },
          ),
          const Divider(), // Adds a divider between items
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              NavigatorService.pushNamed(AppRoutes.changePasswordScreen);
              // Handle tap for Change Password
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever),
            title: const Text('Delete Account'),
            onTap: () {
              // Handle tap for Delete Account

              _showDeleteConfirmationDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Organization'),
            onTap: () {
              // Handle tap for Contact Info
              NavigatorService.pushNamed(AppRoutes.organizationNameScreen);
              // _showContactInfoDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Organization Logo And Map'),
            onTap: () {
              // Handle tap for Organization Logo
              NavigatorService.pushNamed(AppRoutes.organizationScreen);
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.map),
          //   title: const Text('Organization Map'),
          //   onTap: () {
          //     // Handle tap for Organization Map
          //   },
          // ),
          // const Divider(),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              onPressed: () {
                // Handle account deletion logic here
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account deleted successfully.'),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
