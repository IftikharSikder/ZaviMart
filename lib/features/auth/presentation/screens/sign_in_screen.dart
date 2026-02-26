import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zavi_bazaar/app/routes/app_router.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/responsive/responsive_helper.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/core/widgets/custom_button.dart';
import 'package:zavi_bazaar/core/widgets/custom_text.dart';
import 'package:zavi_bazaar/core/widgets/custom_text_field.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'package:zavi_bazaar/gen/assets.gen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double width = MediaQuery.sizeOf(context).width;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Assets.images.logo.image(width: width * .18)),
                SizedBox(height: Dimensions.paddingSizeDefault),

                CustomText(
                  title: AppConstants.appName,
                  color: theme.primaryColor.withValues(alpha: .8),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: Dimensions.paddingSizeSmall),

                CustomText(
                  title: AppConstants.welcome,
                  fontSize: Dimensions.fontSizeExtraLarge,
                  color: theme.hintColor.withValues(alpha: .6),
                  fontWeight: FontWeight.bold,
                ),

                CustomText(
                  title: AppConstants.signInMsg,
                  fontSize: Dimensions.fontSizeLarge,
                  color: theme.hintColor.withValues(alpha: .4),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: Dimensions.paddingSizeExtraOverLarge),

                CustomTextField(
                  controller: _emailController,
                  prefix: Icon(Icons.email),
                  hintText: AppConstants.email,
                ),
                BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, isVisible) {
                    print("=================> $isVisible");
                    return CustomTextField(
                      controller: _passwordController,
                      suffixIcon: Icon(isVisible ? Icons.remove_red_eye : Icons.password),
                      prefix: Icon(Icons.lock),
                      hintText: AppConstants.password,
                      isPasswordShouldVisible: isVisible,
                      isPassword: true,
                      onSuffixIconTap: () =>
                          context.read<PasswordVisibilityCubit>().changeVisibility(),
                    );
                  },
                ),
                SizedBox(height: Dimensions.paddingSizeDefault),

                CustomButton(
                  onTap: () => context.goNamed(Routes.dashboard.name),
                  buttonText: AppConstants.signIn,
                  isTextCenter: true,
                  isGradient: true,
                  gradientButtonColor: [
                    theme.primaryColor.withValues(alpha: .7),
                    theme.primaryColor,
                  ],
                ),
              ],
            )
          : Center(child: Text(AppConstants.notSupportedMsg, style: AppTextStyles.robotoRegular)),
    );
  }
}
