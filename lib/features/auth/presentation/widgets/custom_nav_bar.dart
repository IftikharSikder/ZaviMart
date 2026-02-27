import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_bloc.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_event.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_state.dart';
import 'package:zavi_bazaar/gen/assets.gen.dart';

import 'custom_nav_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).width;
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SizedBox(
          height: height * .20,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black.withValues(alpha: .1))),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomNavItem(
                        label: AppConstants.home,
                        imgPath: state.index == 0
                            ? AppConstants.navItemFilled[0]
                            : AppConstants.navItemOutlined[0],
                        selected: state.index == 0,
                        onTap: () => context.read<NavigationBloc>().add(ChangeNavigation(index: 0)),
                      ),

                      CustomNavItem(
                        label: AppConstants.message,
                        imgPath: state.index == 1
                            ? AppConstants.navItemFilled[1]
                            : AppConstants.navItemOutlined[1],
                        selected: state.index == 1,
                        onTap: () => context.read<NavigationBloc>().add(ChangeNavigation(index: 1)),
                      ),

                      const SizedBox(width: 70),

                      CustomNavItem(
                        label: AppConstants.cart,
                        imgPath: state.index == 3
                            ? AppConstants.navItemFilled[2]
                            : AppConstants.navItemOutlined[2],
                        counterIndicatorValue: 1,
                        selected: state.index == 3,
                        onTap: () => context.read<NavigationBloc>().add(ChangeNavigation(index: 3)),
                      ),

                      CustomNavItem(
                        label: AppConstants.account,
                        imgPath: state.index == 4
                            ? AppConstants.navItemFilled[3]
                            : AppConstants.navItemOutlined[3],
                        selected: state.index == 4,
                        onTap: () => context.read<NavigationBloc>().add(ChangeNavigation(index: 4)),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => context.read<NavigationBloc>().add(ChangeNavigation(index: 2)),
                    child: Container(
                      height: height * .13,
                      width: height * .13,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                            color: Colors.black.withValues(alpha: 0.15),
                          ),
                        ],
                      ),
                      child: Center(child: Assets.images.discount.image(fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
