import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zavi_bazaar/app/routes/app_router.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/responsive/responsive_helper.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/core/widgets/custom_text.dart';
import 'package:zavi_bazaar/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    final animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _bounceAnimation = Tween<double>(begin: -20.0, end: 20.0).animate(animation);
    _animationController.repeat(reverse: true);

    if (mounted) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) context.goNamed(Routes.signIn.name);
      });
    }

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
    return Scaffold(
      body: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _bounceAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _bounceAnimation.value),
                      child: Center(child: Assets.images.logo.image(width: width * .18)),
                    );
                  },
                ),
                SizedBox(height: Dimensions.paddingSizeOverLarge),

                CustomText(
                  title: AppConstants.appName,
                  fontSize: 40,
                  color: Theme.of(context).primaryColor.withValues(alpha: .8),
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          : Center(child: Text(AppConstants.notSupportedMsg, style: AppTextStyles.robotoRegular)),
    );
  }
}
