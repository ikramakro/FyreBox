import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../core/app_export.dart';
import '../../data/models/device_model.dart';
import '../../widgets/custom_drop_down.dart';
import 'models/device_model.dart';
import 'package:intl/intl.dart';

import 'provider/device_provider.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  DeviceScreenState createState() => DeviceScreenState();

  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviceProvider(),
      child: const DeviceScreen(),
    );
  }
}

class DeviceScreenState extends State<DeviceScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _key = GlobalKey<ExpandableFabState>();
  void _showDeleteConfirmationDialog(
      BuildContext context, DBData device, DeviceProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Device'),
          content: const Text('Are you sure you want to delete this device?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                await provider.deleteDevice(device.id.toString());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDeviceDialog(
      BuildContext context, DBData device, DeviceProvider provider) {
    // Pre-fill the controllers with the current device values
    provider.deviceTypeController.text = device.deviceTypeName ?? '';
    provider.deviceLocationController.text = device.deviceLocation ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Device'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Dropdown for device type
                CustomDropDown(
                  hintText: '-- Select Device Type --',
                  items: provider.deviceModelObj.deviceTypeDropdownItemList,
                  onChanged: (value) {
                    provider.setDeviceType(value.id.toString());
                  },
                ),

                // TextField for updating device location
                TextField(
                  controller: provider.deviceLocationController,
                  decoration:
                      const InputDecoration(labelText: 'Device Location'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () async {
                // Call the update device function here
                await provider.updateDevice(device.id.toString());
                Navigator.of(context).pop(); // Close the dialog after updating
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeviceDetailsBottomSheet(BuildContext context, DBData device) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Device Details',
                      style: CustomTextStyles
                          .headlineSmallMontserratBluegray90001),
                  const SizedBox(height: 10),
                  _buildDetailRow('Device ID', device.id.toString()),
                  _buildDetailRow('Device Key', device.deviceKey),
                  _buildDetailRow('Device Type', device.deviceTypeName),
                  _buildDetailRow('Location', device.deviceLocation),
                  _buildDetailRow('Client Name', device.orgName),
                  _buildDetailRow('Device Status',
                      device.status == '1' ? 'Active' : 'Inactive'),
                  _buildDetailRow(
                      'Installation Time', device.entryTimeFormated),
                  const SizedBox(height: 20),
                  Text('Manufacturer Details',
                      style: CustomTextStyles
                          .headlineSmallMontserratBluegray90001),
                  const SizedBox(height: 10),
                  _buildDetailRow('Name', device.mfrName),
                  _buildDetailRow('Contact', device.mfrContact),
                  _buildDetailRow('Email', device.mfrEmail),
                  _buildDetailRow(
                      'Mfr Date', _formatTimestamp(device.mfrDate.toString())),
                  _buildDetailRow('Serial Number', device.mfrSerialNo),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: CustomTextStyles.labelLargeBold),
          Expanded(
            child: Text(
              value ?? '-',
              style: CustomTextStyles.bodyLargeBlack900,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) {
      return '-';
    }
    var dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    return DateFormat('dd-MM-yyyy hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviceProvider(),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: SpeedDial(
              spacing: 3,
              animatedIcon: AnimatedIcons.menu_close,
              // activeBackgroundColor: Colors.red,
              // activeForegroundColor: Colors.red,
              // overlayColor: Colors.red,
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.devices),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: 'Add Device',
                  onTap: () {
                    NavigatorService.pushNamed(AppRoutes.addDeviceScreen);
                  },
                ),
                SpeedDialChild(
                  child: const Icon(Icons.add),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: 'Order Device',
                  onTap: () {
                    NavigatorService.pushNamed(AppRoutes.orderDeviceScreen);
                  },
                ),
                // SpeedDialChild(
                // child: const Icon(Icons.add),
                // backgroundColor: Colors.red,
                // foregroundColor: Colors.white,
                // label: 'Add Device Type',
                // onTap: () {
                // NavigatorService.pushNamed(AppRoutes.orderDeviceScreen);
                // },
                // ),
              ]),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     NavigatorService.pushNamed(AppRoutes.addDeviceScreen);
          //   },
          //   backgroundColor: Colors.red,
          //   child: const Icon(Icons.add),
          // ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Consumer<DeviceProvider>(
            builder: (context, provider, child) {
              print(
                  '===>>>>>>>    ${provider.model.dbData?[0].deviceCiteName ?? []}');
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50.v,
                            width: 200.v,
                            child: Selector<DeviceProvider, DeviceModel?>(
                              selector: (context, provider) =>
                                  provider.deviceModelObj,
                              builder: (context, userModelObj, child) {
                                return CustomDropDown(
                                  icon: Container(
                                    margin: EdgeInsets.only(left: 16.h),
                                    child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgArrowdropdownfilled,
                                      height: 20.h,
                                      width: 24.h,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    print(value.title);
                                    provider.onChanged(value.title);
                                  },
                                  hintText: "Filter".tr,
                                  hintStyle: theme.textTheme.bodyLarge!,
                                  items: userModelObj?.dropdownItemList ?? [],
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.h,
                                    vertical: 18.h,
                                  ),
                                );
                              },
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                provider.downloadFile();
                              },
                              child: const Text('Download CheckList'))
                        ],
                      ),
                    ),
                    SizedBox(width: 20.h),
                    const Divider(),
                    Consumer<DeviceProvider>(
                        builder: (context, provider, child) {
                      if (provider.model.dbData == null) {
                        return Center(
                            child: Text(provider.model.errorDescription ?? ''));
                      }
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SfDataGridTheme(
                            data: SfDataGridThemeData(
                                headerColor: appTheme.deepOrangeA100,
                                gridLineColor: appTheme.pink300),
                            child: SfDataGrid(
                              source: DeviceDataSource(
                                  devices: provider.model.dbData ?? [],
                                  onDelete: (device) =>
                                      _showDeleteConfirmationDialog(
                                          context, device, provider),
                                  onView: (device) =>
                                      _showDeviceDetailsBottomSheet(
                                          context, device),
                                  onUpdate: (device) => _showUpdateDeviceDialog(
                                      context, device, provider)),
                              gridLinesVisibility: GridLinesVisibility.both,
                              headerGridLinesVisibility:
                                  GridLinesVisibility.both,
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                              onQueryRowHeight: (details) {
                                return 30;
                              },
                              columns: <GridColumn>[
                                GridColumn(
                                  columnName: 'no',
                                  label: const Center(child: Text('No')),
                                ),
                                GridColumn(
                                    columnName: 'name',
                                    label: const Center(
                                        child: Text('Device Name'))),
                                GridColumn(
                                    columnName: 'sitename',
                                    label:
                                        const Center(child: Text('Site Name'))),
                                GridColumn(
                                    columnName: 'devicekey',
                                    label: const Center(
                                        child: Text('Device Key'))),
                                GridColumn(
                                    columnName: 'devicetype',
                                    label: const Center(
                                        child: Text('Device Type'))),
                                GridColumn(
                                    columnName: 'location',
                                    label:
                                        const Center(child: Text('Location'))),
                                GridColumn(
                                    columnName: 'status',
                                    label: const Center(child: Text('Status'))),
                                GridColumn(
                                    columnName: 'actions',
                                    label:
                                        const Center(child: Text('Actions'))),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DeviceDataSource extends DataGridSource {
  DeviceDataSource(
      {required List<DBData> devices,
      required this.onDelete,
      required this.onView,
      required this.onUpdate}) {
    _devices = devices
        .map<DataGridRow>((device) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'no', value: device.id.toString()),
              DataGridCell<String>(
                  columnName: 'name', value: device.deviceName ?? ''),
              DataGridCell<String>(
                  columnName: 'sitename', value: device.deviceCiteName ?? ''),
              DataGridCell<String>(
                  columnName: 'devicekey', value: device.deviceKey ?? ''),
              DataGridCell<String>(
                  columnName: 'devicetype', value: device.deviceTypeName ?? ''),
              DataGridCell<String>(
                  columnName: 'location', value: device.deviceLocation ?? ''),
              DataGridCell<Widget>(
                  columnName: 'status',
                  value: Card(
                    color: device.status == '1'
                        ? Colors.lightGreen
                        : Colors.red.withOpacity(.5),
                    child: Center(
                        child:
                            Text(device.status == '1' ? 'Active' : 'Inactive')),
                  )),
              DataGridCell<Widget>(
                  columnName: 'actions',
                  value: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'View') {
                        onView(device);
                      } else if (value == 'Delete') {
                        onDelete(device);
                      } else if (value == 'Update') {
                        onUpdate(device);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {
                        'View',
                        'Delete',
                        'Update',
                      }.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  )),
            ]))
        .toList();
  }

  List<DataGridRow> _devices = [];
  final Function(DBData) onDelete;
  final Function(DBData) onView;
  final Function(DBData) onUpdate;

  @override
  List<DataGridRow> get rows => _devices;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
      Center(child: Text(row.getCells()[4].value.toString())),
      Center(child: Text(row.getCells()[5].value.toString())),
      SizedBox(
        height: 10.v,
        width: 10.h,
        child: row.getCells()[6].value,
      ),
      SizedBox(
        height: 10.v,
        width: 5.h,
        child: row.getCells()[7].value,
      ),
    ]);
  }
}
