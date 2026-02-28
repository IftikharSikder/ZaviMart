// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/roboto
  $AssetsFontsRobotoGen get roboto => const $AssetsFontsRobotoGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/discount.png
  AssetGenImage get discount =>
      const AssetGenImage('assets/images/discount.png');

  /// Directory path: assets/images/icons
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/placeholder.png
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/placeholder.png');

  /// File path: assets/images/promotional_banner.png
  AssetGenImage get promotionalBanner =>
      const AssetGenImage('assets/images/promotional_banner.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    discount,
    logo,
    placeholder,
    promotionalBanner,
  ];
}

class $AssetsFontsRobotoGen {
  const $AssetsFontsRobotoGen();

  /// File path: assets/fonts/roboto/Roboto-Black.ttf
  String get robotoBlack => 'assets/fonts/roboto/Roboto-Black.ttf';

  /// File path: assets/fonts/roboto/Roboto-Bold.ttf
  String get robotoBold => 'assets/fonts/roboto/Roboto-Bold.ttf';

  /// File path: assets/fonts/roboto/Roboto-Light.ttf
  String get robotoLight => 'assets/fonts/roboto/Roboto-Light.ttf';

  /// File path: assets/fonts/roboto/Roboto-Medium.ttf
  String get robotoMedium => 'assets/fonts/roboto/Roboto-Medium.ttf';

  /// File path: assets/fonts/roboto/Roboto-Regular.ttf
  String get robotoRegular => 'assets/fonts/roboto/Roboto-Regular.ttf';

  /// List of all assets
  List<String> get values => [
    robotoBlack,
    robotoBold,
    robotoLight,
    robotoMedium,
    robotoRegular,
  ];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/camera_search.png
  AssetGenImage get cameraSearch =>
      const AssetGenImage('assets/images/icons/camera_search.png');

  /// File path: assets/images/icons/cart_filled.png
  AssetGenImage get cartFilled =>
      const AssetGenImage('assets/images/icons/cart_filled.png');

  /// File path: assets/images/icons/cart_outlined.png
  AssetGenImage get cartOutlined =>
      const AssetGenImage('assets/images/icons/cart_outlined.png');

  /// File path: assets/images/icons/home_filled.png
  AssetGenImage get homeFilled =>
      const AssetGenImage('assets/images/icons/home_filled.png');

  /// File path: assets/images/icons/home_outlined.png
  AssetGenImage get homeOutlined =>
      const AssetGenImage('assets/images/icons/home_outlined.png');

  /// File path: assets/images/icons/message_filled.png
  AssetGenImage get messageFilled =>
      const AssetGenImage('assets/images/icons/message_filled.png');

  /// File path: assets/images/icons/message_outlined.png
  AssetGenImage get messageOutlined =>
      const AssetGenImage('assets/images/icons/message_outlined.png');

  /// File path: assets/images/icons/profile_filled.png
  AssetGenImage get profileFilled =>
      const AssetGenImage('assets/images/icons/profile_filled.png');

  /// File path: assets/images/icons/profile_outlined.png
  AssetGenImage get profileOutlined =>
      const AssetGenImage('assets/images/icons/profile_outlined.png');

  /// File path: assets/images/icons/upload_outline.png
  AssetGenImage get uploadOutline =>
      const AssetGenImage('assets/images/icons/upload_outline.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    cameraSearch,
    cartFilled,
    cartOutlined,
    homeFilled,
    homeOutlined,
    messageFilled,
    messageOutlined,
    profileFilled,
    profileOutlined,
    uploadOutline,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
