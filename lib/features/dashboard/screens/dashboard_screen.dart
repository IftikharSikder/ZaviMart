import 'package:flutter/material.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/responsive/responsive_helper.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: isMobile
          ? Center(child: Text("dashboard screen"))
          : Center(child: Text(AppConstants.notSupportedMsg, style: AppTextStyles.robotoRegular)),
    );
  }
}
