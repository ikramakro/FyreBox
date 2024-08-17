import 'package:fyrebox/core/app_export.dart';
import 'package:fyrebox/widgets/custom_text_form_field1.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/device_provider.dart'; // Assuming you have this provider

class OrderDeviceScreen extends StatefulWidget {
  const OrderDeviceScreen({super.key});

  @override
  OrderDeviceScreenState createState() => OrderDeviceScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviceProvider(),
      child: const OrderDeviceScreen(),
    );
  }
}

class OrderDeviceScreenState extends State<OrderDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Device(s)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<DeviceProvider>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Device Type:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomDropDown(
                  hintText: '-- Select Device Type --',
                  items:
                      provider.deviceModelObj.orderdeviceTypeDropdownItemList,
                  onChanged: (value) {
                    provider.setOrderDeviceType(value.title);
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField1(
                  controller: provider.quantityController,
                  hintText: 'Quantity',
                  // keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                CustomTextFormField1(
                  controller: provider.descriptionController,
                  hintText: 'Description',
                ),
                const SizedBox(height: 24.0),
                CustomElevatedButton(
                  buttonStyle: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(appTheme.deepOrangeA100)),
                  onPressed: () {
                    // provider.orderDevice();
                  },
                  text: 'Order Device',
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
