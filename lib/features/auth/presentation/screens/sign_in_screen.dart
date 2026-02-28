import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:zavi_bazaar/app/routes/app_router.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/responsive/responsive_helper.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/core/utils/api_error_handler.dart';
import 'package:zavi_bazaar/core/utils/custom_snackbar.dart';
import 'package:zavi_bazaar/core/widgets/custom_button.dart';
import 'package:zavi_bazaar/core/widgets/custom_text.dart';
import 'package:zavi_bazaar/core/widgets/custom_text_field.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/password_visibility/password_visibility_cubit.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:zavi_bazaar/gen/assets.gen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final loader = SpinKitFadingCircle(color: AppConstants.primaryColor, size: 50.0);

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 10),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double width = MediaQuery.sizeOf(context).width;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: isMobile
          ? Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position: _slideAnimation,
                        child: Center(child: Assets.images.logo.image(width: width * .18)),
                      ),
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
                        validationText: AppConstants.emailValidationMsg,
                        prefix: Icon(Icons.email),
                        hintText: AppConstants.email,
                      ),
                      BlocBuilder<PasswordVisibilityCubit, bool>(
                        builder: (context, isVisible) {
                          print("=================> $isVisible");
                          return CustomTextField(
                            controller: _passwordController,
                            validationText: AppConstants.passValidationMsg,
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

                      BlocConsumer<SignInBloc, SignInState>(
                        listener: (context, state) {
                          if (state is SuccessState) {
                            customSnackbar(msg: ApiErrorHandler.getMessage(state.statusCode));
                            context.goNamed(Routes.dashboard.name);
                          } else if (state is ErrorState) {
                            customSnackbar(msg: state.errorMsg.toString(), isError: true);
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            buttonText: AppConstants.signIn,
                            isTextCenter: true,
                            isGradient: true,
                            gradientButtonColor: [
                              theme.primaryColor.withValues(alpha: .7),
                              theme.primaryColor,
                            ],
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignInBloc>().add(ValidateUserEvent());
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Container(
                        color: Colors.black.withValues(alpha: .3),
                        child: Center(child: loader),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            )
          : Center(child: Text(AppConstants.notSupportedMsg, style: AppTextStyles.robotoRegular)),
    );
  }
}
