import 'package:flutter/material.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/responsive/responsive_helper.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/core/widgets/custom_text.dart';
import 'package:zavi_bazaar/core/widgets/custom_text_field.dart';
import 'package:zavi_bazaar/gen/assets.gen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      body: isMobile
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Assets.images.logo.image(width: 70)),
                  SizedBox(height: Dimensions.paddingSizeDefault),

                  CustomText(
                    title: AppConstants.appName,
                    fontSize: 40,
                    color: Theme.of(context).primaryColor.withValues(alpha: .8),
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: Dimensions.paddingSizeSmall),

                  CustomText(
                    title: AppConstants.welcome,
                    fontSize: Dimensions.fontSizeExtraLarge,
                    color: Theme.of(context).hintColor.withValues(alpha: .6),
                    fontWeight: FontWeight.bold,
                  ),

                  CustomText(
                    title: AppConstants.signInMsg,
                    fontSize: Dimensions.fontSizeLarge,
                    color: Theme.of(context).hintColor.withValues(alpha: .4),
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: Dimensions.paddingSizeExtraLarge),

                  CustomTextField(
                    controller: _emailController,
                    prefix: Icon(Icons.email),
                    hintText: AppConstants.email,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    prefix: Icon(Icons.lock),
                    hintText: AppConstants.password,
                    isSuffix: true,
                  ),
                ],
              ),
            )
          : Center(child: Text(AppConstants.notSupportedMsg, style: AppTextStyles.robotoRegular)),
    );
  }
}
