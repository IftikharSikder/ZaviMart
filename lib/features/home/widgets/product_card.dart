import 'package:flutter/material.dart';
import 'package:zavi_bazaar/app/theme/app_text_styles.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/core/constants/app_images.dart';
import 'package:zavi_bazaar/core/ui/dimensions.dart';
import 'package:zavi_bazaar/core/widgets/custom_text.dart';
import 'package:zavi_bazaar/features/home/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? product;
  const ProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, Dimensions.paddingSizeDefault, 10, 0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Dimensions.radiusLarge),
                    ),
                    child: product == null
                        ? Container(color: Colors.grey.shade200)
                        : Image.network(
                            product!.image,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(AppImages.placeholderImage);
                            },
                          ),
                  ),
                ),

                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: Dimensions.fontSizeOverSmall,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          product?.rating.rate.toString() ?? '0',
                          style: TextStyle(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      size: Dimensions.radiusLarge,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimensions.paddingSizeSmall,
                8,
                Dimensions.paddingSizeSmall,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    maxLine: 2,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: AppTextStyles.robotoBlack.copyWith(
                      fontSize: Dimensions.fontSizeOverSmall,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    title: product?.title ?? '',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: product != null ? '\$${product!.price.toStringAsFixed(2)}' : '\$0',
                        textStyle: AppTextStyles.robotoRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: AppConstants.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: Dimensions.fontSizeExtraLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
