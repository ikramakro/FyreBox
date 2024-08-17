// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:provider/provider.dart';

// import 'package:intl/intl.dart';

// import '../../core/utils/constant.dart';
// import '../../data/models/org_detail.dart';
// import '../../theme/theme_helper.dart';
// import '../../widgets/custom_elevated_button.dart';

// class EmergencyScreen extends StatefulWidget {
//   const EmergencyScreen({super.key});

//   @override
//   _EmergencyScreenState createState() => _EmergencyScreenState();

// }

// class _EmergencyScreenState extends State<EmergencyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Device'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Your existing form fields go here...
          
//               const SizedBox(height: 24.0),
//               const Text('Helplines',
//                   style: TextStyle(
//                       fontSize: 16.0, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 16.0),
//               // DataGrid
//               helplines != null && helplines!.isNotEmpty
//                   ? SfDataGrid(
//                       source: HelplineDataSource(
//                           helplines: helplines!),
//                       gridLinesVisibility: GridLinesVisibility.both,
//                       headerGridLinesVisibility: GridLinesVisibility.both,
//                       columnWidthMode: ColumnWidthMode.fitByCellValue,
//                       columns: <GridColumn>[
//                         GridColumn(
//                           columnName: 'no',
//                           label: const Center(child: Text('No.')),
//                         ),
//                         GridColumn(
//                           columnName: 'name',
//                           label: const Center(child: Text('Name')),
//                         ),
//                         GridColumn(
//                           columnName: 'type',
//                           label: const Center(child: Text('Type')),
//                         ),
//                         GridColumn(
//                           columnName: 'phone',
//                           label: const Center(child: Text('Phone')),
//                         ),
//                         GridColumn(
//                           columnName: 'address',
//                           label: const Center(child: Text('Address')),
//                         ),
//                         GridColumn(
//                           columnName: 'status',
//                           label: const Center(child: Text('Status')),
//                         ),
//                         GridColumn(
//                           columnName: 'entryTime',
//                           label: const Center(child: Text('Entry Time')),
//                         ),
//                         GridColumn(
//                           columnName: 'actions',
//                           label: const Center(child: Text('Actions')),
//                         ),
//                       ],
//                     )
//                   : const Center(child: Text('No Helplines Available')),
//               const SizedBox(height: 24.0),
//               CustomElevatedButton(
//                 buttonStyle: ButtonStyle(
//                     backgroundColor:
//                         WidgetStateProperty.all(appTheme.deepOrangeA100)),
//                 onPressed: () {
//                   // provider.addDevice();
//                 },
//                 text: 'Add Device',
//                 height: 50,
//                 width: double.infinity,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class HelplineDataSource extends DataGridSource {
//   HelplineDataSource({required List<Helpline> helplines}) {
//     _helplines = helplines
//         .map<DataGridRow>((helpline) => DataGridRow(cells: [
//               DataGridCell<String>(columnName: 'no', value: helpline.id),
//               DataGridCell<String>(columnName: 'name', value: helpline.name),
//               DataGridCell<String>(columnName: 'type', value: helpline.type),
//               DataGridCell<String>(columnName: 'phone', value: helpline.phone),
//               DataGridCell<String>(columnName: 'address', value: helpline.address),
//               DataGridCell<Widget>(
//                   columnName: 'status',
//                   value: FlutterSwitch(
//                     width: 55.0,
//                     height: 25.0,
//                     valueFontSize: 12.0,
//                     toggleSize: 18.0,
//                     value: true,
//                     borderRadius: 20.0,
//                     padding: 2.0,
//                     showOnOff: true,
//                     onToggle: (val) {
//                       // Handle toggle action
//                     },
//                   )),
//               DataGridCell<String>(
//                   columnName: 'entryTime',
//                   value: DateFormat('MM/dd/yyyy HH:mm').format(
//                       DateTime.fromMillisecondsSinceEpoch(int.parse(helpline.id ?? '0') * 1000))),
//               DataGridCell<Widget>(
//                   columnName: 'actions',
//                   value: PopupMenuButton<String>(
//                     onSelected: (String value) {
//                       // Handle actions
//                     },
//                     itemBuilder: (BuildContext context) {
//                       return {'Edit', 'Delete'}.map((String choice) {
//                         return PopupMenuItem<String>(
//                           value: choice,
//                           child: Text(choice),
//                         );
//                       }).toList();
//                     },
//                   )),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _helplines = [];

//   @override
//   List<DataGridRow> get rows => _helplines;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(cells: [
//       Center(child: Text(row.getCells()[0].value.toString())),
//       Center(child: Text(row.getCells()[1].value.toString())),
//       Center(child: Text(row.getCells()[2].value.toString())),
//       Center(child: Text(row.getCells()[3].value.toString())),
//       Center(child: Text(row.getCells()[4].value.toString())),
//       Center(child: row.getCells()[5].value),
//       Center(child: Text(row.getCells()[6].value.toString())),
//       Center(child: row.getCells()[7].value),
//     ]);
//   }
// }
