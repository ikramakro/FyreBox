import 'package:flutter/material.dart';
import 'package:fyrebox/data/models/emergency_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field1.dart';
import 'provider/emergency_provider.dart';

import 'package:syncfusion_flutter_core/theme.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Method to show the update helpline popup
  void _showUpdateHelplinePopup(BuildContext context, DBDATA helpline) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Helpline Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10.0),
                const Text('Helpline Name:', style: TextStyle(fontSize: 12.0)),
                CustomTextFormField1(
                  hintText: helpline.name,
                ),
                const SizedBox(height: 10.0),
                const Text('Helpline Status:',
                    style: TextStyle(fontSize: 12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: helpline.status == '1',
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            helpline.status = '1'; // Set to Active
                          } else {
                            helpline.status =
                                '0'; // Uncheck, so set to Inactive
                          }
                        });
                      },
                    ),
                    const Text('Active'),
                    Checkbox(
                      value: helpline.status == '0',
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            helpline.status = '0'; // Set to Inactive
                          } else {
                            helpline.status = '1'; // Uncheck, so set to Active
                          }
                        });
                      },
                    ),
                    const Text('Inactive'),
                  ],
                )
              ],
            ),
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
              onPressed: () {
                // Call the provider update method
                // final provider =
                //     Provider.of<EmergencyProvider>(context, listen: false);
                // provider.updateHelpline(helpline); // Update the helpline
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Method to show the delete confirmation dialog
  void _showDeleteConfirmationDialog(
      BuildContext context, DBDATA helpline, EmergencyProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Helpline'),
          content: const Text('Are you sure you want to delete this helpline?'),
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
                provider.deleteHelpline(helpline.id.toString());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmergencyProvider(),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NavigatorService.pushNamed(AppRoutes.addHelplineScreen);
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.add),
          ),
          body: Consumer<EmergencyProvider>(
            builder: (context, provider, child) {
              if (provider.model.dBDATA == null ||
                  provider.model.dBDATA!.isEmpty) {
                return const Center(
                  child: Text('No helplines found'),
                );
              }
              return SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  children: [
                    const Divider(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                              headerColor: appTheme.deepOrangeA100,
                              gridLineColor: appTheme.pink300),
                          child: SfDataGrid(
                            source: HelplineDataSource(
                              helplines: provider.model.dBDATA!,
                              onUpdate: (helpline) =>
                                  _showUpdateHelplinePopup(context, helpline),
                              onDelete: (helpline) =>
                                  _showDeleteConfirmationDialog(
                                      context, helpline, provider),
                            ),
                            gridLinesVisibility: GridLinesVisibility.both,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            columnWidthMode: ColumnWidthMode.fitByCellValue,
                            columns: <GridColumn>[
                              GridColumn(
                                columnName: 'no',
                                label: const Center(child: Text('No')),
                              ),
                              GridColumn(
                                columnName: 'name',
                                label: const Center(child: Text('Name')),
                              ),
                              GridColumn(
                                columnName: 'type',
                                label: const Center(child: Text('Type')),
                              ),
                              GridColumn(
                                columnName: 'phone',
                                label: const Center(child: Text('Phone')),
                              ),
                              GridColumn(
                                columnName: 'address',
                                label: const Center(child: Text('Address')),
                              ),
                              GridColumn(
                                columnName: 'status',
                                label: const Center(child: Text('Status')),
                              ),
                              GridColumn(
                                columnName: 'entryTime',
                                label: const Center(child: Text('Entry Time')),
                              ),
                              GridColumn(
                                columnName: 'actions',
                                label: const Center(child: Text('Actions')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

class HelplineDataSource extends DataGridSource {
  HelplineDataSource({
    required List<DBDATA> helplines,
    required this.onUpdate,
    required this.onDelete,
  }) {
    _helplines = helplines
        .map<DataGridRow>((helpline) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'no', value: helpline.id.toString()),
              DataGridCell<String>(
                  columnName: 'name', value: helpline.name ?? ''),
              DataGridCell<String>(
                  columnName: 'type', value: helpline.type ?? ''),
              DataGridCell<String>(
                  columnName: 'phone', value: helpline.phone ?? ''),
              DataGridCell<String>(
                  columnName: 'address', value: helpline.address ?? ''),
              DataGridCell<Widget>(
                  columnName: 'status',
                  value: FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    value: helpline.status == '1',
                    borderRadius: 20.0,
                    padding: 2.0,
                    showOnOff: true,
                    onToggle: (val) {
                      // You can handle status update here
                    },
                  )),
              DataGridCell<String>(
                  columnName: 'entryTime',
                  value: DateFormat('MM/dd/yyyy HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          helpline.entryTime ?? 0))),
              DataGridCell<Widget>(
                  columnName: 'actions',
                  value: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'Update') {
                        onUpdate(helpline);
                      } else if (value == 'Delete') {
                        onDelete(helpline);
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

  List<DataGridRow> _helplines = [];
  final Function(DBDATA) onUpdate;
  final Function(DBDATA) onDelete;

  @override
  List<DataGridRow> get rows => _helplines;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
      Center(child: Text(row.getCells()[4].value.toString())),
      Center(child: row.getCells()[5].value),
      Center(child: Text(row.getCells()[6].value.toString())),
      Center(child: row.getCells()[7].value),
    ]);
  }
}
