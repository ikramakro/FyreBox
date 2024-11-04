import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field1.dart';
import 'contact_fyrebox_provider.dart';

class ContactFyreBoxScreen extends StatelessWidget {
  const ContactFyreBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactFyreBoxProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact FyreBox'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Consumer<ContactFyreBoxProvider>(
              builder: (context, provider, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField1(
                    controller: provider.subjectController,
                    hintText: 'Enter subject',
                    borderDecoration: const OutlineInputBorder(),
                    //contentPadding:
                    // const EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Priority:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  CustomDropDown(
                    hintText: '-- Select Priority --',
                    items: provider.itemlist ?? [],
                    onChanged: (value) {
                      provider.setPriority(value.id.toString());
                    },
                    borderDecoration: const OutlineInputBorder(),
                    //contentPadding:
                    // const EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Description:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField1(
                    controller: provider.descriptionController,
                    hintText: 'Enter description',
                    maxLines: 5,
                    borderDecoration: const OutlineInputBorder(),
                    //contentPadding: const EdgeInsets.all(12.0),
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: CustomElevatedButton(
                      width: 180,
                      text: 'Submit',
                      onPressed: () {
                        provider.submitContactForm(); // Handle the submission
                      },
                      buttonStyle: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        textStyle: const TextStyle(fontSize: 16.0),
                        backgroundColor: const Color(0xffd61a21),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
