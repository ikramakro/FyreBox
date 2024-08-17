import 'package:toastification/toastification.dart';

import '../../data/models/org_detail.dart';
import '../app_export.dart';

// enum Status { LOADING, EROR, SUCCESS }

// Future<bool> storagePermission() async {
//   final DeviceInfoPlugin info =
//       DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';
//   final AndroidDeviceInfo androidInfo = await info.androidInfo;
//   debugPrint('releaseVersion : ${androidInfo.version.release}');
//   final int androidVersion = int.parse(androidInfo.version.release);

//   if (androidVersion >= 13) {
//     return true;
//   } else {
//     return false;
//   }
// }

showSuccess(String text) {
  return toastification.show(
    // context: context, // optional if you use ToastificationWrapper
    type: ToastificationType.success,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 1),
    title: const Text('Success'),
    // you can also use RichText widget for title and description parameters
    description: RichText(text: TextSpan(text: text)),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 100),
    // animationBuilder:
    //     (context, animation, alignment, child) {
    //   return FadeTransition(opacity: 10,
    //     turns: animation,
    //     child: child,
    //   );
    // },
    icon: const Icon(Icons.check),
    primaryColor: Colors.green,
    backgroundColor: Colors.green,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
    // callbacks: ToastificationCallbacks(
    //   onTap: (toastItem) =>
    //       print('Toast ${toastItem.id} tapped'),
    //   onCloseButtonTap: (toastItem) => print(
    //       'Toast ${toastItem.id} close button tapped'),
    //   onAutoCompleteCompleted: (toastItem) => print(
    //       'Toast ${toastItem.id} auto complete completed'),
    //   onDismissed: (toastItem) => print(
    //       'Toast ${toastItem.id} dismissed'),
    // ),
  );
}

showError(String text) {
  return toastification.show(
    // context: context, // optional if you use ToastificationWrapper
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 2),
    title: const Text('Error'),
    // you can also use RichText widget for title and description parameters
    description: RichText(text: TextSpan(text: text)),
    alignment: Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 100),
    // animationBuilder:
    //     (context, animation, alignment, child) {
    //   return FadeTransition(opacity: 10,
    //     turns: animation,
    //     child: child,
    //   );
    // },
    icon: const Icon(Icons.cancel_outlined),
    primaryColor: Colors.red,
    backgroundColor: Colors.red,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
    // callbacks: ToastificationCallbacks(
    //   onTap: (toastItem) =>
    //       print('Toast ${toastItem.id} tapped'),
    //   onCloseButtonTap: (toastItem) => print(
    //       'Toast ${toastItem.id} close button tapped'),
    //   onAutoCompleteCompleted: (toastItem) => print(
    //       'Toast ${toastItem.id} auto complete completed'),
    //   onDismissed: (toastItem) => print(
    //       'Toast ${toastItem.id} dismissed'),
    // ),
  );
}
List<EvacuationMap>? evacuationMaps;
  List<Helpline>? helplines;
  DBData?  dbData;
// String appId = 'f8580b0a2vtst';
// String jwtToken = '';
// String oneIDnigol = '';
// List<MultipleInstanceModel> multipleInstanceData = [];
// List<Chunks> deshBoardHits = [];
// List<Chunks> dashboardChunks = [];
// List<SelectionPopupModel> group = [];
// List<SelectionPopupModel> signatures = [];
// List<SelectionPopupModel> account = [];
// bool isNumberVerified = false;
