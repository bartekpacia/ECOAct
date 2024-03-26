/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesAnswersGen get answers => const $AssetsImagesAnswersGen();
}

class $AssetsImagesAnswersGen {
  const $AssetsImagesAnswersGen();

  /// File path: assets/images/answers/bicycle.png
  AssetGenImage get bicycle =>
      const AssetGenImage('assets/images/answers/bicycle.png');

  /// File path: assets/images/answers/car.png
  AssetGenImage get car => const AssetGenImage('assets/images/answers/car.png');

  /// File path: assets/images/answers/electric_bicycle.png
  AssetGenImage get electricBicycle =>
      const AssetGenImage('assets/images/answers/electric_bicycle.png');

  /// File path: assets/images/answers/electric_car.png
  AssetGenImage get electricCar =>
      const AssetGenImage('assets/images/answers/electric_car.png');

  /// File path: assets/images/answers/fish.png
  AssetGenImage get fish =>
      const AssetGenImage('assets/images/answers/fish.png');

  /// File path: assets/images/answers/home.png
  AssetGenImage get home =>
      const AssetGenImage('assets/images/answers/home.png');

  /// File path: assets/images/answers/imported_products.png
  AssetGenImage get importedProducts =>
      const AssetGenImage('assets/images/answers/imported_products.png');

  /// File path: assets/images/answers/local_products.png
  AssetGenImage get localProducts =>
      const AssetGenImage('assets/images/answers/local_products.png');

  /// File path: assets/images/answers/meat.png
  AssetGenImage get meat =>
      const AssetGenImage('assets/images/answers/meat.png');

  /// File path: assets/images/answers/motorcycle.png
  AssetGenImage get motorcycle =>
      const AssetGenImage('assets/images/answers/motorcycle.png');

  /// File path: assets/images/answers/pizza.png
  AssetGenImage get pizza =>
      const AssetGenImage('assets/images/answers/pizza.png');

  /// File path: assets/images/answers/train.png
  AssetGenImage get train =>
      const AssetGenImage('assets/images/answers/train.png');

  /// File path: assets/images/answers/vegetables.png
  AssetGenImage get vegetables =>
      const AssetGenImage('assets/images/answers/vegetables.png');

  /// File path: assets/images/answers/walking.png
  AssetGenImage get walking =>
      const AssetGenImage('assets/images/answers/walking.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bicycle,
        car,
        electricBicycle,
        electricCar,
        fish,
        home,
        importedProducts,
        localProducts,
        meat,
        motorcycle,
        pizza,
        train,
        vegetables,
        walking
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
