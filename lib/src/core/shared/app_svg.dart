import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../packages.dart';
// import 'package:lottie/lottie.dart';

class SvgWidget extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final Color? color;
  const SvgWidget(this.name, {super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/$name.svg',
      height: height,
      width: width,
      color: color,
    );
  }
}

class LottiesWidget extends StatelessWidget {
  const LottiesWidget({required this.name, this.height, super.key});
  final String name;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/zip/$name.zip', height: height,);
  }
}

class ImageWidget extends StatelessWidget {
  final String? name;
  final double? height;
  final double? width;
  final Color? color;
  const ImageWidget(this.name, {super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/${name??'0'}.png',
      height: height,
      width: width,
      color: color,
    );
  }
}


class NairaText extends StatelessWidget {
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  const NairaText({
    Key? key,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AssetConstants.nairaSymbol,
      style: TextStyle(
          fontFamily: 'Ariel',
          fontSize: fontSize,
          fontWeight: fontWeight ?? AppFontWeight.regular,
          color: color),
    );
  }
}
