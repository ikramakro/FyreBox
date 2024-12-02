import 'package:fyrebox/data/models/emergency_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field1.dart';
import 'provider/emergency_provider.dart';

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

  void _showUpdateHelplinePopup(
      BuildContext context, DBDATA helpline, EmergencyProvider provider) {
    // Initialize controllers and the status value
    provider.nameController = TextEditingController(text: helpline.name);
    provider.addressController = TextEditingController(text: helpline.address);
    String status = helpline.status ?? ''; // Store the initial status

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Update Helpline Details'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  const Text('Helpline Name:',
                      style: TextStyle(fontSize: 12.0)),
                  CustomTextFormField1(
                    controller: provider.nameController,
                    hintText: 'Enter helpline name',
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Helpline Address:',
                      style: TextStyle(fontSize: 12.0)),
                  CustomTextFormField1(
                    controller: provider.addressController,
                    hintText: 'Enter helpline address',
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Helpline Status:',
                      style: TextStyle(fontSize: 12.0)),
                  Row(
                    children: [
                      Checkbox(
                        value: status == '1',
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              status = '1'; // Set to Active
                            } else {
                              status = ''; // Uncheck both
                            }
                          });
                        },
                      ),
                      const Text('Active'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: status == '0',
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              status = '0'; // Set to Inactive
                            } else {
                              status = ''; // Uncheck both
                            }
                          });
                        },
                      ),
                      const Text('Inactive'),
                    ],
                  ),
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
                  // Update the helpline with the new values
                  helpline.name = provider.nameController.text;
                  helpline.address = provider.addressController.text;
                  helpline.status = status; // Update the status
                  provider.updateHelpline(
                      helpline, status); // Call provider update method

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
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
                            allowFiltering: true,
                            source: HelplineDataSource(
                              helplines: provider.model.dBDATA!,
                              onUpdate: (helpline) => _showUpdateHelplinePopup(
                                  context, helpline, provider),
                              onDelete: (helpline) =>
                                  _showDeleteConfirmationDialog(
                                      context, helpline, provider),
                            ),
                            gridLinesVisibility: GridLinesVisibility.both,
                            headerGridLinesVisibility: GridLinesVisibility.both,
                            columnWidthMode: ColumnWidthMode.auto,
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
                                allowFiltering: false,
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
              DataGridCell<String>(
                  columnName: 'status',
                  value: helpline.status == '1' ? 'Active' : 'Inactive'),
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
      SizedBox(
        height: 10.v,
        width: 10.h,
        child: Card(
          color: row.getCells()[5].value.toString() == 'Active'
              ? Colors.lightGreen
              : Colors.red.withOpacity(.5),
          child: Center(
              child: Text(row.getCells()[5].value.toString() == 'Active'
                  ? 'Active'
                  : 'Inactive')),
        ),
      ),
      Center(child: row.getCells()[6].value),
    ]);
  }
}
