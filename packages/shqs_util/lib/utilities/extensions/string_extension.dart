import 'dart:convert';
import 'dart:math';

import 'package:uuid/uuid.dart';

class UUID {
  static String get randomUuid => Uuid().v1();
}

extension ShqsString on String {
  /// Make JsonString to formatted String
  String pretty() => JsonEncoder.withIndent('  ').convert(json.decode(this));

  /// Parse to URI
  Uri get toUri => Uri.parse(this);

  /// Parse to escapeNewLineCharacters
  String escapeNewLineCharacters(){

    var exprs= {
      '\\\\n':'\n',
      '\\n':'\n',
      //'\n':'\n',
      '\t':'',
      '\r':'',
      //'\\\\\\\\':'',
      '\\\\':'',
      //'\\':'',
    };
    var data = this;
    exprs.forEach((expr, replace) {data = data.replaceAll( RegExp(expr), replace);});
    //print(data);
    return data;
  }

}

extension Version on String {

  // lhs < rhs = -1
  // lhs == rhs = 0
  // lhs > rhs = 1
  int compareToVersion(String rhs) {
    const separator = '.';
    var comparisonResult = 0;
    if (this != rhs) {
      final thisVersion = split(separator);
      final rhsVersion = rhs.split(separator);
      for (var index = 0;
          index < max(thisVersion.length, rhsVersion.length);
          index++) {
        final thisSegment = index < thisVersion.length
            ? (int.tryParse(thisVersion[index]) ?? 0)
            : 0;
        final rhsSegment = index < rhsVersion.length
            ? (int.tryParse(rhsVersion[index]) ?? 0)
            : 0;
        if (thisSegment < rhsSegment) {
          comparisonResult = -1;
          break;
        } else if (thisSegment > rhsSegment) {
          comparisonResult = 1;
          break;
        }
      }
    }
    return comparisonResult;
  }

  bool isEqualTo({required String version}) => compareToVersion(version) == 0;
  bool isOlderThan({required String version}) => compareToVersion(version) < 0;
  bool isNewerThan({required String version}) => compareToVersion(version) > 0;
  bool isEqualOrOlderThan({required String version}) =>
      compareToVersion(version) != 1;
  bool isEqualOrNewerThan({required String version}) =>
      compareToVersion(version) != -1;
}
