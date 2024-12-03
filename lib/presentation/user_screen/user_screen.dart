import 'package:flutter_switch/flutter_switch.dart';
import 'package:fyrebox/data/models/user_data_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'models/user_model.dart';
import 'provider/user_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  UserScreenState createState() => UserScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const UserScreen(),
    );
  }
}

class UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, DBDATA user, UserProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: const Text('Are you sure you want to delete this user?'),
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
                await provider.deleteUser(user.id.toString());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUserDetailsBottomSheet(BuildContext context, DBDATA user) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('User Details',
                    style:
                        CustomTextStyles.headlineSmallMontserratBluegray90001),
                const SizedBox(height: 10),
                Text('User Information',
                    style:
                        CustomTextStyles.headlineSmallMontserratBluegray90001),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name', style: CustomTextStyles.labelLargeBold),
                    Text('${user.userName}',
                        style: CustomTextStyles.labelLargeBold),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email', style: CustomTextStyles.labelLargeBold),
                    Text('${user.userEmail}',
                        style: CustomTextStyles.labelLargeBold),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Role', style: CustomTextStyles.labelLargeBold),
                    Text(user.userRole == '1' ? 'Admin' : 'Artisan',
                        style: CustomTextStyles.labelLargeBold),
                  ],
                ),
                const SizedBox(height: 20),
                Text('User Permissions',
                    style:
                        CustomTextStyles.headlineSmallMontserratBluegray90001),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Full Access:',
                        style: CustomTextStyles.labelLargeBold),
                    FlutterSwitch(
                      height: 20.0,
                      width: 35.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: appTheme.deepOrangeA100,
                      value: user.permissions?.fullAccess == '1',
                      onToggle: (value) {
                        // setState(() {
                        //   isToggled = value;
                        // });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Insert Access:',
                        style: CustomTextStyles.labelLargeBold),
                    // SizedBox(
                    //   height: 10,
                    //   width: 20,
                    //   child: Switch(
                    //     value: user.permissions?.insertAccess == '1',
                    //     onChanged: (bool value) {},
                    //   ),
                    // ),
                    FlutterSwitch(
                      height: 20.0,
                      width: 35.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: appTheme.deepOrangeA100,
                      value: user.permissions?.insertAccess == '1',
                      onToggle: (value) {
                        // setState(() {
                        //   isToggled = value;
                        // });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Update Access:',
                        style: CustomTextStyles.labelLargeBold),
                    FlutterSwitch(
                      height: 20.0,
                      width: 35.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: appTheme.deepOrangeA100,
                      value: user.permissions?.updateAccess == '1',
                      onToggle: (value) {
                        // setState(() {
                        //   isToggled = value;
                        // });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delete Access:',
                        style: CustomTextStyles.labelLargeBold),
                    FlutterSwitch(
                      height: 20.0,
                      width: 35.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: appTheme.deepOrangeA100,
                      value: user.permissions?.deleteAccess == '1',
                      onToggle: (value) {
                        // setState(() {
                        //   isToggled = value;
                        // });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NavigatorService.pushNamed(AppRoutes.addOrgScreen);
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.add),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Consumer<UserProvider>(
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
                            child: Selector<UserProvider, UserModel?>(
                              selector: (context, provider) =>
                                  provider.userModelObj,
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
                        ],
                      ),
                    ),
                    SizedBox(width: 20.h),
                    const Divider(),
                    Consumer<UserProvider>(builder: (context, provider, child) {
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
                              gridLineColor: appTheme.pink300,
                            ),
                            child: SfDataGrid(
                              allowFiltering: true,
                              autoExpandGroups: true,
                              source: UserDataSource(
                                  users: provider.model.dBDATA ?? [],
                                  onDelete: (user) =>
                                      _showDeleteConfirmationDialog(
                                          context, user, provider),
                                  onView: (user) => _showUserDetailsBottomSheet(
                                      context, user)),
                              gridLinesVisibility: GridLinesVisibility.both,
                              headerGridLinesVisibility:
                                  GridLinesVisibility.both,
                              columnWidthMode: ColumnWidthMode.auto,
                              onQueryRowHeight: (details) {
                                return 30;
                              },
                              columns: <GridColumn>[
                                GridColumn(
                                  columnName: 'id',
                                  label: const Center(child: Text('ID')),
                                ),
                                GridColumn(
                                    columnName: 'name',
                                    label: const Center(child: Text('Name'))),
                                GridColumn(
                                    columnName: 'email',
                                    label: const Center(child: Text('Email'))),
                                GridColumn(
                                    columnName: 'role',
                                    label: const Center(child: Text('Role'))),
                                GridColumn(
                                    allowFiltering: false,
                                    columnName: 'status',
                                    label: const Center(child: Text('Status'))),
                                GridColumn(
                                    columnName: 'regDate',
                                    label:
                                        const Center(child: Text('Reg Date'))),
                                GridColumn(
                                    allowFiltering: false,
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

class UserDataSource extends DataGridSource {
  UserDataSource({
    required List<DBDATA> users,
    required this.onDelete,
    required this.onView,
  }) {
    int counter = 1; // Initialize counter starting from 1
    _users = users.map<DataGridRow>((user) {
      final newRow = DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'id', value: counter.toString()), // Use counter for ID
        DataGridCell<String>(columnName: 'name', value: user.userName),
        DataGridCell<String>(columnName: 'email', value: user.userEmail),
        DataGridCell<String>(
            columnName: 'role',
            value: user.userRole == '1' ? 'Admin' : "Artisan"),
        DataGridCell<String>(
          columnName: 'status',
          value: user.status == '1' ? 'Active' : 'In Active',
        ),
        DataGridCell<DateTime>(
            columnName: 'regDate',
            value: DateTime.fromMillisecondsSinceEpoch(
                int.parse(user.entryTime.toString() ?? '') * 1000)),
        DataGridCell<Widget>(
          columnName: 'actions',
          value: PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'View') {
                onView(user);
              } else if (value == 'Delete') {
                onDelete(user);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'View', 'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ),
      ]);
      counter++; // Increment the counter for the next ID
      return newRow;
    }).toList();
  }

  List<DataGridRow> _users = [];
  final Function(DBDATA) onDelete;
  final Function(DBDATA) onView;

  @override
  List<DataGridRow> get rows => _users;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
      SizedBox(
        height: 10.v,
        width: 10.h,
        child: Card(
          color: row.getCells()[4].value == 'Active'
              ? Colors.lightGreen
              : Colors.red.withOpacity(.5),
          child: Center(
              child: Text(row.getCells()[4].value == 'Active'
                  ? 'Active'
                  : 'In Active')),
        ),
      ),
      Center(
          child:
              Text(DateFormat('yyyy-MM-dd').format(row.getCells()[5].value))),
      SizedBox(
        height: 10.v,
        width: 5.h,
        child: row.getCells()[6].value,
      ),
    ]);
  }
}
