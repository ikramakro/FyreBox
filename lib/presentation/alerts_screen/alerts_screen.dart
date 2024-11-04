import 'package:flutter/material.dart';
import 'package:fyrebox/data/models/alert_model.dart';
import 'package:fyrebox/presentation/alerts_screen/models/alerts_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_radio_button.dart';
import 'provider/alerts_provider.dart'; // Assuming you have this widget

import 'package:syncfusion_flutter_core/theme.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  AlertScreenState createState() => AlertScreenState();

  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlertsProvider(),
      child: const AlertScreen(),
    );
  }
}

class AlertScreenState extends State<AlertScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showUpdateAlertPopup(
      BuildContext context, DBDATA alert, AlertsProvider provider) {
    // final provider = Provider.of<AlertsProvider>(context, listen: false);
    provider.setSelectedStatus(alert.status);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Alert Details'),
          content: Consumer<AlertsProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Text('Alert Status:', style: TextStyle(fontSize: 12.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadioButton(
                        value: '1',
                        groupValue: provider.selectedStatus,
                        text: 'Active',
                        onChange: (value) {
                          provider.setSelectedStatus(value);
                        },
                      ),
                      CustomRadioButton(
                        value: '0',
                        groupValue: provider.selectedStatus,
                        text: 'Inactive',
                        onChange: (value) {
                          provider.setSelectedStatus(value);
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () async {
                await provider.updateAlertStatus(alert.id.toString());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, DBDATA alert, AlertsProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Alert'),
          content: const Text('Are you sure you want to delete this alert?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // final provider =
                //     Provider.of<AlertsProvider>(context, listen: false);
                provider.deleteAlert(alert.id.toString());
                Navigator.of(context).pop();
              },
            ),
          ],
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
          Text(title, style: const TextStyle(fontSize: 16.0)),
          Expanded(
            child: Text(
              value ?? '-',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlertsProvider(),
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // NavigatorService.pushNamed(AppRoutes.addAlertScreen);
          //   },
          //   backgroundColor: Colors.red,
          //   child: const Icon(Icons.add),
          // ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Consumer<AlertsProvider>(
            builder: (context, provider, child) {
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
                            child: Selector<AlertsProvider, AlertsModel?>(
                              selector: (context, provider) =>
                                  provider.alertModel,
                              builder: (context, alertModel, child) {
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
                                    provider.onChanged(value.title);
                                  },
                                  hintText: "Filter".tr,
                                  hintStyle: theme.textTheme.bodyLarge!,
                                  items: alertModel?.dropdownItemList ?? [],
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.h,
                                    vertical: 18.h,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.h),
                    const Divider(),
                    Consumer<AlertsProvider>(
                        builder: (context, provider, child) {
                      if (provider.model.dBDATA == null) {
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
                              source: AlertDataSource(
                                  alerts: provider.model.dBDATA ?? [],
                                  onUpdate: (alert) => _showUpdateAlertPopup(
                                      context, alert, provider),
                                  onDelete: (alert) =>
                                      _showDeleteConfirmationDialog(
                                          context, alert, provider)),
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
                                    columnName: 'color',
                                    width: 50, // Reduced width of color column
                                    label: const Center(child: Text('Color'))),
                                GridColumn(
                                    columnName: 'alert',
                                    label: const Center(child: Text('Alert'))),
                                GridColumn(
                                    columnName: 'deviceKey',
                                    label: const Center(
                                        child: Text('Device Key'))),
                                GridColumn(
                                    columnName: 'client',
                                    label: const Center(child: Text('Client'))),
                                GridColumn(
                                    columnName: 'description',
                                    label: const Center(
                                        child: Text('Description')),
                                    width: 200), // Added width constraint
                                GridColumn(
                                    columnName: 'status',
                                    label: const Center(child: Text('Status'))),
                                GridColumn(
                                    columnName: 'entryTime',
                                    label: const Center(
                                        child: Text('Entry Time'))),
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

class AlertDataSource extends DataGridSource {
  AlertDataSource(
      {required List<DBDATA> alerts,
      required this.onUpdate,
      required this.onDelete}) {
    _alerts = alerts
        .map<DataGridRow>((alert) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'no', value: alert.id.toString()),
              DataGridCell<Widget>(
                  columnName: 'color',
                  value: Container(
                    height: 20,
                    width: 30,
                    color: alert.alertColor != null
                        ? Color(int.parse(
                            alert.alertColor!.replaceFirst('#', '0xff')))
                        : Colors.transparent,
                  )),
              DataGridCell<String>(columnName: 'alert', value: alert.alertName),
              DataGridCell<String>(
                  columnName: 'deviceKey', value: alert.deviceKey),
              DataGridCell<String>(columnName: 'client', value: alert.orgName),
              DataGridCell<String>(
                columnName: 'description',
                value: alert.alertDescription,
              ), // Set lineSpan to 3
              DataGridCell<Widget>(
                  columnName: 'status',
                  value: Card(
                    color: alert.status == '1'
                        ? Colors.lightGreen
                        : Colors.red.withOpacity(.5),
                    child: Center(
                        child:
                            Text(alert.status == '1' ? 'Active' : 'Inactive')),
                  )),
              DataGridCell<String>(
                  columnName: 'entryTime', value: alert.entryTimeFormated),
              DataGridCell<Widget>(
                  columnName: 'actions',
                  value: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'Update') {
                        onUpdate(alert);
                      } else if (value == 'Delete') {
                        onDelete(alert);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Update', 'Delete'}.map((String choice) {
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

  List<DataGridRow> _alerts = [];
  final Function(DBDATA) onUpdate;
  final Function(DBDATA) onDelete;

  @override
  List<DataGridRow> get rows => _alerts;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: row.getCells()[1].value),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(
          child: Text(
        row.getCells()[3].value.toString(),
        maxLines: 2,
      )),
      Center(child: Text(row.getCells()[4].value.toString())),
      Center(
        child: Text(
          row.getCells()[5].value.toString(),
          maxLines: 3, // Allow description to span up to 3 lines
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Center(child: row.getCells()[6].value),
      Center(child: Text(row.getCells()[7].value.toString())),
      Center(child: row.getCells()[8].value),
    ]);
  }
}
