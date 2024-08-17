import 'package:flutter/material.dart';
import 'package:fyrebox/presentation/device_screen/device_screen.dart';
import 'package:fyrebox/presentation/root_screen/provider/root_provider.dart';
import '../../core/app_export.dart';
import '../../core/utils/constant.dart';
import '../alerts_screen/alerts_screen.dart';
import '../contact_screen.dart';
import '../deshboard_screen/deshboard_screen.dart';
import '../emergency_screen/add_emergency_screen.dart';
import '../emergency_screen/emergency_screen.dart';
import '../setting/setting_screen.dart';
import '../user_screen/user_screen.dart';
import '../visitor_screen/vistor_screen.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index ?? 0;
  }

  List<Widget> _buildScreens() {
    return [
      const DeshboardScreen(),
      const UserScreen(),
      const DeviceScreen(),
      const AlertScreen(),
      const VistorScreen(),
      const EmergencyScreen(),
      
const SettingsScreen(),
      const ContactFyreBoxScreen(),
    ];
  }

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close the drawer after selecting an item
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title:  Text(_selectedIndex==0?'Dashboard Screnn':_selectedIndex==1?'User Screen':_selectedIndex==2?'Devices Screen':_selectedIndex==3?'Alerts Screen':_selectedIndex==4?'Vistors Screen':_selectedIndex==5?'Emergence Screen':_selectedIndex==6?'Setting Screen':'Contact FyreBox'),
          backgroundColor: Color(0xffd61a21),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Colors.transparent, // Background color inside the border
          border: Border.all(
            color: Colors.white, // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(7.0), // Rounded corners
        ),
        child: const Center(
          child: const Icon(
            Icons.notifications,
            color: Colors.white, // Icon color
            size: 15.0, // Icon size
          ),
        ),
      ), 
      SizedBox(width: 10.h,),
      Container(
        width: 40.0.h,
        height: 40.0.v,
        decoration: BoxDecoration(
          color: Colors.transparent, // Background color inside the border
          border: Border.all(
            color: Colors.white, // Border color
            width: 2.0.h, // Border width
          ),
          borderRadius: BorderRadius.circular(7.0), // Rounded corners
        ),
        child: CustomImageView(
            imagePath: 'https://fyreboxhub.com/assets/images/${dbData?.orgLogo??''}',
            // height: 212.h,
            // width: double.maxFinite,
            // margin: EdgeInsets.only(right: 16.h),
            fit: BoxFit.contain,
          )
      ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(.6),
                ),
                child: Column(
                  children: [
 CustomImageView(
            imagePath: ImageConstant.imgFyreboxLogo,
            height: 112.h,
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 16.h),
            fit: BoxFit.contain,
          ),
                    // const SizedBox(height: 8),
                    // const Text(
                    //   'FyreBox',
                    //   style: TextStyle(color: Colors.white, fontSize: 18),
                    // ),
                  ],
                ),
              ),
             InkWell(
              onTap:() => _onDrawerItemTapped(0),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child: Text(
                           'DashBoard',
                           style: TextStyle(
                color: _selectedIndex==0?Colors.red:Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
             SizedBox(height: 10.v,),
              InkWell(
              onTap:() => _onDrawerItemTapped(1),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                           'User',
                           style: TextStyle(
              
                color: _selectedIndex==1?Colors.red:Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
              SizedBox(height: 10.v,),
               InkWell(
              onTap:() => _onDrawerItemTapped(2),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                           'Devices',
                           style: TextStyle(

                color: _selectedIndex==2?Colors.red:Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
              SizedBox(height: 10.v,),
               InkWell(
              onTap:() => _onDrawerItemTapped(3),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                           'Alerts',
                           style: TextStyle(

                color: _selectedIndex==3?Colors.red:Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
              SizedBox(height: 10.v,),
              
              InkWell(
              onTap:() => _onDrawerItemTapped(4),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                           'Visitors',
                           style: TextStyle(

                color: _selectedIndex==4?Colors.red:Colors.black,// Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
              SizedBox(height: 10.v,),
              InkWell(
              onTap:() => _onDrawerItemTapped(5),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                           'Emergency \nContact',
                           style: TextStyle(

                color: _selectedIndex==5?Colors.red:Colors.black,// Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
              SizedBox(height: 10.v,),
              InkWell(
              onTap:() => _onDrawerItemTapped(6),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                           'Settings',
                           style: TextStyle(

                color: _selectedIndex==6?Colors.red:Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
              
             SizedBox(height: 10.v,),
              InkWell(
              onTap:() => _onDrawerItemTapped(7),
               child: Container(
                         width: 120, // Adjust the width as needed
                         height: 120, // Adjust the height as needed
                         decoration: BoxDecoration(
                           image: DecorationImage(
                image: AssetImage(ImageConstant.imgdeshboard), // Replace with your image path
                fit: BoxFit.contain,
                           ),
                           borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                         
                         ),
                         alignment: Alignment.center, // Center the text inside the container
                         child:  Text(
                          maxLines: 2,
                           'Contact \nFyreBox',
                           style: TextStyle(

                color: _selectedIndex==7?Colors.red:Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Text style
                           
                           ),
                           textAlign: TextAlign.center, // Align text in the center
                         ),
                       ),
             ),
            ],
          ),
        ),
        body: _buildScreens()[_selectedIndex],
      ),
    );
  }
}
