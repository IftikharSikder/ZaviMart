import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ResponsiveHelper {
  static bool isWeb() {
    return kIsWeb;
  }

  static bool isMobile(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    if (size <= 600 && !kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTab(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    if (size <= 600 && size < 1300) {
      return true;
    } else {
      return false;
    }
  }
}
