import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

import 'padding.dart';

/// AES/CBC encrypt / decrypt
class SecurityUtils {
  static List<int> get _baseByteArray =>
      '00001101-0000-1000-8000-00805F9B34FB'.codeUnits;

  static Key get _defaultKey {
    final sha = sha256.convert(_baseByteArray).toString().substring(0, 32);
    return Key(Uint8List.fromList(utf8.encode(sha).sublist(0, 32)));
  }

  static IV get _defaultIv {
    final bytes =
        utf8.encode(Base64Encoder().convert(_baseByteArray)).sublist(0, 16);
    return IV(Uint8List.fromList(bytes));
  }

  static String encrypt(String source,
      {Padding padding = Padding.pkcs7, String? seed}) {
    var key = _defaultKey;
    var iv = _defaultIv;
    if (seed != null) {
      key = _generateKey(seed);
      iv = _generateIv(seed);
    }

    return Encrypter(AES(key, mode: AESMode.cbc, padding: padding.name))
        .encrypt(source, iv: iv)
        .base64;
  }

  static String decrypt(String source,
      {Padding padding = Padding.pkcs7, String? seed}) {
    var key = _defaultKey;
    var iv = _defaultIv;
    if (seed != null) {
      key = _generateKey(seed);
      iv = _generateIv(seed);
    }

    return Encrypter(AES(key, mode: AESMode.cbc, padding: padding.name))
        .decrypt(Encrypted.fromBase64(source), iv: iv);
  }

  static Key _generateKey(String seed) {
    final sha = sha256.convert(seed.codeUnits).toString().substring(0, 32);
    return Key(Uint8List.fromList(utf8.encode(sha).sublist(0, 32)));
  }

  static IV _generateIv(String seed) {
    final bytes =
        utf8.encode(Base64Encoder().convert(seed.codeUnits)).sublist(0, 16);
    return IV(Uint8List.fromList(bytes));
  }
}

/// Encrypt / Decrypt
///
/// ```Dart
/// // Example
/// 'source to encrypt`.encrypt();
/// `encrypted lang`.decrypt();
/// ```
extension SecurityEx on String {
  String encrypt({Padding padding = Padding.pkcs7, String? seed}) =>
      SecurityUtils.encrypt(this, padding: padding, seed: seed);

  String decrypt({Padding padding = Padding.pkcs7, String? seed}) =>
      SecurityUtils.decrypt(this, padding: padding, seed: seed);
}
