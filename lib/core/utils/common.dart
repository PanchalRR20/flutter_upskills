import 'package:fluttertoast/fluttertoast.dart';
import 'package:upskill_practices/core/utils/strings.dart';

class Common {
  static void showToast({String? msg, int timeInSec = 3}) {
    Fluttertoast.showToast(
      msg: msg!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: timeInSec,
    );
  }

  // getDrawerList(){
  //   List<String> drawerList = [
  //     Strings.kFoundation,
  //     Strings.kResponsiveUI,
  //   ];
  //  return drawerList;
  // }
}
