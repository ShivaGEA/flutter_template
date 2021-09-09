enum Padding {
  // pkcs7 covers pkcs5
  pkcs7,
  iso7816_4,
  no,
}

extension Name on Padding {

  String? get name {

    if (index == Padding.pkcs7.index) {
      return 'PKCS7';
    } else if (index == Padding.iso7816_4.index) {
      return 'ISO7816-4';
    }

    return null;
  }
}
