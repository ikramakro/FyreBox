import 'package:fyrebox/data/models/alert_model.dart';
import 'package:fyrebox/presentation/alerts_screen/models/alerts_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/app_export.dart';
import '../../widgets/customCheckbox.dart';
import '../../widgets/custom_drop_down.dart'; // Replace CustomRadioButton with CustomCheckbox
import 'provider/alerts_provider.dart';

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
                      CustomCheckbox(
                        value: provider.selectedStatus == '1',
                        text: 'Active',
                        onChanged: (value) {
                          provider.setSelectedStatus(value ? '1' : '0');
                        },
                      ),
                      CustomCheckbox(
                        value: provider.selectedStatus == '0',
                        text: 'Inactive',
                        onChanged: (value) {
                          provider.setSelectedStatus(value ? '0' : '1');
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
                                allowFiltering: true,
                                source: AlertDataSource(
                                  alerts: provider.model.dBDATA ?? [],
                                  onUpdate: (alert) => _showUpdateAlertPopup(
                                      context, alert, provider),
                                  onDelete: (alert) =>
                                      _showDeleteConfirmationDialog(
                                          context, alert, provider),
                                  onDeviceTypeClick: (alert) =>
                                      _showDeviceKeyPopup(context, alert),
                                  archiveAlert: (alert) => provider
                                      .archivealert(alert.id.toString()),
                                ),
                                gridLinesVisibility: GridLinesVisibility.both,
                                headerGridLinesVisibility:
                                    GridLinesVisibility.both,
                                columnWidthMode: ColumnWidthMode.auto,
                                onQueryRowHeight: (details) => 30,
                                columns: <GridColumn>[
                                  GridColumn(
                                      columnName: 'no',
                                      label: const Center(child: Text('No'))),
                                  GridColumn(
                                      allowFiltering: false,
                                      columnName: 'color',
                                      width: 100,
                                      label:
                                          const Center(child: Text('Color'))),
                                  GridColumn(
                                      columnName: 'alert',
                                      label:
                                          const Center(child: Text('Alert'))),
                                  GridColumn(
                                      columnName: 'deviceType',
                                      label: const Center(
                                          child: Text('Device Type'))),
                                  GridColumn(
                                      columnName: 'location',
                                      label: const Center(
                                          child: Text('Location'))),
                                  GridColumn(
                                      columnName: 'client',
                                      label:
                                          const Center(child: Text('Client'))),
                                  GridColumn(
                                      allowFiltering: false,
                                      columnName: 'description',
                                      width: 200,
                                      label: const Center(
                                          child: Text('Description'))),
                                  GridColumn(
                                      allowFiltering: false,
                                      columnName: 'status',
                                      label:
                                          const Center(child: Text('Status'))),
                                  GridColumn(
                                      columnName: 'entryTime',
                                      label: const Center(
                                          child: Text('Entry Time'))),
                                  GridColumn(
                                      allowFiltering: false,
                                      columnName: 'actions',
                                      label:
                                          const Center(child: Text('Actions'))),
                                ],
                              )),
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

void _showDeviceKeyPopup(BuildContext context, DBDATA alert) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Device Key'),
      content: Text(alert.deviceKey ?? 'No Key Available'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

class AlertDataSource extends DataGridSource {
  AlertDataSource({
    required List<DBDATA> alerts,
    required this.onUpdate,
    required this.onDelete,
    required this.onDeviceTypeClick,
    required this.archiveAlert,
  }) {
    int counter = 1;
    _alerts = alerts.map<DataGridRow>((alert) {
      final row = DataGridRow(cells: [
        DataGridCell<String>(columnName: 'no', value: counter.toString()),
        DataGridCell<Widget>(
          columnName: 'color',
          value: Container(
            width: 20,
            height: 20,
            color:
                Color(int.parse(alert.alertColor!.replaceFirst('#', '0xff'))),
          ),
        ),
        DataGridCell<String>(columnName: 'alert', value: alert.alertName),
        DataGridCell<Widget>(
          columnName: 'deviceType',
          value: GestureDetector(
            onTap: () => onDeviceTypeClick(alert),
            child: Text(
              alert.devicetypename ?? '-',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        DataGridCell<String>(
            columnName: 'location', value: alert.devicelocation),
        DataGridCell<String>(columnName: 'client', value: alert.orgName),
        DataGridCell<String>(
            columnName: 'description', value: alert.alertDescription),
        DataGridCell<Widget>(
          columnName: 'status',
          value: Center(
              child: SizedBox(
            width: 100,
            height: 70,
            child: Card(
              color: alert.status == '1'
                  ? Colors.lightGreen
                  : Colors.red.withOpacity(.5),
              child: Center(
                  child: Text(alert.status == '1' ? 'Active' : 'Inactive')),
            ),
          )),
        ),
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
              } else if (value == 'Archive') {
                archiveAlert(alert);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Update', 'Delete', 'Archive'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ),
      ]);
      counter++;
      return row;
    }).toList();
  }

  List<DataGridRow> _alerts = [];
  final Function(DBDATA) onUpdate;
  final Function(DBDATA) onDelete;
  final Function(DBDATA) onDeviceTypeClick;
  final Function(DBDATA) archiveAlert;
  @override
  List<DataGridRow> get rows => _alerts;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Center(
          child:
              cell.value is Widget ? cell.value : Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
