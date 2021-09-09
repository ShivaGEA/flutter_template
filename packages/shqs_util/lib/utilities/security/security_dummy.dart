import 'padding.dart';

/// AES/CBC encrypt / decrypt - Dummy
// Temporary block for web
// https://github.com/geappliances/mobile.service.smarthq/runs/2938424996?check_suite_focus=true
class SecurityUtils {
  static String encrypt(String source,
          {Padding padding = Padding.pkcs7, String? seed}) =>
      source;

  static String decrypt(String source,
          {Padding padding = Padding.pkcs7, String? seed}) =>
      source;
}

extension SecurityEx on String {
  /// Encrypt / Decrypt
  ///
  /// ```Dart
  /// // Example
  /// 'source to encrypt`.encrypt();
  /// `encrypted lang`.decrypt();
  /// ```
  String encrypt({Padding padding = Padding.pkcs7, String? seed}) =>
      SecurityUtils.encrypt(this, padding: padding, seed: seed);

  String decrypt({Padding padding = Padding.pkcs7, String? seed}) =>
      SecurityUtils.decrypt(this, padding: padding, seed: seed);
}
