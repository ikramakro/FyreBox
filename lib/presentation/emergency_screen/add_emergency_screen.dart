import '../../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field1.dart';
import 'provider/emergency_provider.dart';

class AddHelplineScreen extends StatefulWidget {
  const AddHelplineScreen({super.key});

  @override
  _AddHelplineScreenState createState() => _AddHelplineScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmergencyProvider(),
      child: const AddHelplineScreen(),
    );
  }
}

class _AddHelplineScreenState extends State<AddHelplineScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Helpline'),
        backgroundColor: const Color(0xffd61a21),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField1(
                controller: _nameController,
                hintText: 'Helpline\'s Name',
              ),
              SizedBox(
                height: 20.v,
              ),
              CustomTextFormField1(
                controller: _typeController,
                hintText: 'Type',
              ),
              SizedBox(
                height: 20.v,
              ),
              CustomTextFormField1(
                controller: _phoneController,
                hintText: 'Phone Number',
              ),
              SizedBox(
                height: 20.v,
              ),
              CustomTextFormField1(
                controller: _addressController,
                hintText: 'Address',
              ),
              SizedBox(
                height: 20.v,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text('Organization Status:'),
                  Row(
                    children: [
                      const Text('Organization Status:'),
                      Checkbox(
                        value: _isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = value!;
                          });
                        },
                      ),
                      const Text('Active'),
                      Checkbox(
                        value: !_isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = !value!;
                          });
                        },
                      ),
                      const Text('Inactive'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                buttonStyle: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(appTheme.deepOrangeA100)),
                text: 'Add Helpline',
                onPressed: () {
                  _addHelpline();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addHelpline() {
    final provider = Provider.of<EmergencyProvider>(context, listen: false);
    provider.addHelpline(
      name: _nameController.text,
      type: _typeController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      status: _isActive ? '1' : '0',
    );
  }
}
