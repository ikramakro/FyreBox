import 'package:fyrebox/data/models/vistors_model.dart';
import 'package:fyrebox/widgets/custom_text_form_field1.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'models/vistor_model.dart';
import 'provider/vistor_provider.dart'; // Assuming you have this widget

import 'package:syncfusion_flutter_core/theme.dart';

class VistorScreen extends StatefulWidget {
  const VistorScreen({super.key});

  @override
  VistorScreenState createState() => VistorScreenState();

  Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VisitorProvider(),
      child: const VistorScreen(),
    );
  }
}

class VistorScreenState extends State<VistorScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showUpdateVisitorPopup(
      BuildContext context, DBDATA visitor, VisitorProvider provider) {
    TextEditingController namecontr =
        TextEditingController(text: visitor.visitorName);
    String visitorStatus = visitor.status!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Update Visitor Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16.0),
                const Text('Visitor Name:', style: TextStyle(fontSize: 12.0)),
                CustomTextFormField1(
                  controller: namecontr,
                  hintText: visitor.visitorName,
                ),
                const SizedBox(height: 16.0),
                const Text('Visitor Status:', style: TextStyle(fontSize: 12.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: visitorStatus == '1',
                      onChanged: (value) {
                        setState(() {
                          visitorStatus = '1';
                        });
                      },
                    ),
                    const Text('Active'),
                    Checkbox(
                      value: visitorStatus == '2',
                      onChanged: (value) {
                        setState(() {
                          visitorStatus = '2';
                        });
                      },
                    ),
                    const Text('Inactive'),
                  ],
                ),
              ],
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
                  provider.updateVisitorData(
                    id: visitor.id.toString(),
                    visitor_name: namecontr.text,
                    visitor_status: visitorStatus,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, DBDATA visitor, VisitorProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Visitor'),
          content: const Text('Are you sure you want to delete this visitor?'),
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
                provider.deleteVisitorData(id: visitor.id.toString());
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
      create: (context) => VisitorProvider(),
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          // onPressed: () {
          // NavigatorService.pushNamed(AppRoutes.addVisitorScreen);
          // },
          // backgroundColor: Colors.red,
          // child: const Icon(Icons.add),
          // ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Consumer<VisitorProvider>(
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
                            child: Selector<VisitorProvider, VistorModel?>(
                              selector: (context, provider) =>
                                  provider.visitorModel,
                              builder: (context, visitorModel, child) {
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
                                  items: visitorModel?.dropdownItemList ?? [],
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
                    Consumer<VisitorProvider>(
                        builder: (context, provider, child) {
                      if (provider.model.dBDATA == null) {
                        return Center(
                            child: Text(provider.model.eRRORDESCRIPTION ?? ''));
                      }
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SfDataGridTheme(
                            data: SfDataGridThemeData(
                                headerColor: appTheme.deepOrangeA100,
                                gridLineColor: appTheme.pink300),
                            child: SfDataGrid(
                              source: VisitorDataSource(
                                visitors: provider.model.dBDATA ?? [],
                                onUpdate: (visitor) => _showUpdateVisitorPopup(
                                    context, visitor, provider),
                                onDelete: (visitor) =>
                                    _showDeleteConfirmationDialog(
                                        context, visitor, provider),
                              ),
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
                                  label: const Center(child: Text('No.')),
                                ),
                                GridColumn(
                                    columnName: 'visitorName',
                                    label: const Center(
                                        child: Text('Visitor Name'))),
                                GridColumn(
                                    columnName: 'visitorPhone',
                                    label: const Center(
                                        child: Text('Visitor Phone'))),
                                GridColumn(
                                    columnName: 'status',
                                    label: const Center(child: Text('Status'))),
                                GridColumn(
                                    columnName: 'entryTime',
                                    label: const Center(
                                        child: Text('Log Time and Date'))),
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

class VisitorDataSource extends DataGridSource {
  VisitorDataSource(
      {required List<DBDATA> visitors,
      required this.onUpdate,
      required this.onDelete}) {
    _visitors = visitors
        .map<DataGridRow>((visitor) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'no', value: visitor.id.toString()),
              DataGridCell<String>(
                  columnName: 'visitorName', value: visitor.visitorName),
              DataGridCell<String>(
                  columnName: 'visitorPhone', value: visitor.visitorPhone),
              DataGridCell<Widget>(
                  columnName: 'status',
                  value: Card(
                    color: visitor.status == '1'
                        ? Colors.lightGreen
                        : Colors.red.withOpacity(.5),
                    child: Center(
                        child: Text(
                            visitor.status == '1' ? 'Active' : 'Inactive')),
                  )),
              DataGridCell<String>(
                  columnName: 'entryTime', value: visitor.entryTimeFormated),
              DataGridCell<Widget>(
                  columnName: 'actions',
                  value: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'Update') {
                        onUpdate(visitor);
                      } else if (value == 'Delete') {
                        onDelete(visitor);
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

  List<DataGridRow> _visitors = [];
  final Function(DBDATA) onUpdate;
  final Function(DBDATA) onDelete;

  @override
  List<DataGridRow> get rows => _visitors;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: row.getCells()[3].value),
      Center(child: Text(row.getCells()[4].value.toString())),
      Center(child: row.getCells()[5].value),
    ]);
  }
}
