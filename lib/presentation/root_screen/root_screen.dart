import 'package:fyrebox/presentation/device_screen/device_screen.dart';
import 'package:fyrebox/presentation/root_screen/provider/root_provider.dart';
import 'package:fyrebox/widgets/app_bar/custom_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../deshboard_screen/deshboard_screen.dart';
import '../user_screen/user_screen.dart';

class RootScreen extends StatefulWidget {
  final int? index;

  const RootScreen({super.key, this.index});

  @override
  RootScreenState createState() => RootScreenState();

  static Widget builder(BuildContext context, {int? index}) {
    return ChangeNotifierProvider(
      create: (context) => RootProvider(),
      child: RootScreen(index: index),
    );
  }
}

class RootScreenState extends State<RootScreen> {
  late PersistentTabController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.index ?? 0);
  }

  List<Widget> _buildScreens() {
    return [
      // Add your screens here
      const DeshboardScreen(),
      const UserScreen(), // Replace with your actual screen widgets
      const DeviceScreen(), // Replace with your actual screen widgets
      // Container(color: Colors.green),
      Container(color: Colors.green), // Replace with your actual screen widgets
      Container(color: Colors.grey),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("User"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.devices),
        title: ("Devices"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.warning_amber_rounded),
        title: ("Alerts"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Visitors"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when the keyboard appears.
        stateManagement: true, // Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgMenu,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 10.h,
          bottom: 10.h,
        ),
        onTap: () => _scaffoldKey.currentState?.openDrawer(), // Open drawer
      ),
      title: AppbarTitle(
        text: "lbl_fyrebox".tr,
        margin: EdgeInsets.only(left: 36.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgAvatarLg,
          margin: EdgeInsets.only(
            top: 10.h,
            right: 15.h,
            bottom: 10.h,
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contact_emergency),
            title: const Text('Emergency Contact'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contact FyreBox'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
