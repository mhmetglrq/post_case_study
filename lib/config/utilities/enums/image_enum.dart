import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Resim ve Svg dosyalarının enum olarak tutulduğu sınıf
enum ImageEnum {
  menu('menu'),
  search('search');

  final String value;
  const ImageEnum(this.value);

  String get toPng => 'assets/images/$value.png';
  String get toSvg => 'assets/svg/$value.svg';

  Image get toPngImage => Image.asset(toPng);
  SvgPicture get toSvgImage => SvgPicture.asset(toSvg);
}
