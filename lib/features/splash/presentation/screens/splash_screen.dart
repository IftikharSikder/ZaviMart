import 'package:flutter/material.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/responsive/responsive_helper.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      body: isMobile
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.logo.image(width: 75),
                  SizedBox(height: Dimensions.paddingSizeDefault),

                  Text(
                    AppConstants.appName,
                    style: AppTextStyles.robotoRegular.copyWith(
                      fontSize: 40,
                      color: Theme.of(context).primaryColor.withValues(alpha: .8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Center(child: Text(AppConstants.notSupportedMsg, style: AppTextStyles.robotoRegular)),
    );
  }
}
