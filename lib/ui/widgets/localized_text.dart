import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocalizedText extends StatelessWidget {
  late final String data;
  late final InlineSpan? textSpan;
  late final TextStyle? style;
  late final StrutStyle? strutStyle;
  late final TextAlign? textAlign;
  late final TextDirection? textDirection;
  late final Locale? locale;
  late final bool? softWrap;
  late final TextOverflow? overflow;
  late final double? textScaleFactor;
  late final int? maxLines;
  late final String? semanticsLabel;
  late final TextWidthBasis? textWidthBasis;

  LocalizedText(this.data,
      {this.style,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis});

  @override
  Widget build(BuildContext context) {
    return Obx(() => _text());
  }

  Widget _text() {
    return Text(data,
        style: this.style,
        strutStyle: this.strutStyle,
        textAlign: this.textAlign,
        textDirection: this.textDirection,
        locale: this.locale,
        softWrap: this.softWrap,
        overflow: this.overflow,
        textScaleFactor: this.textScaleFactor,
        maxLines: this.maxLines,
        semanticsLabel: this.semanticsLabel,
        textWidthBasis: this.textWidthBasis);
  }
}
