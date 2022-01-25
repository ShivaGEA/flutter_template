import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/config/localization/lang/language.dart';

import '../../app.dart';

class LanguageSelectionDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _createLanguageDropDown();
  }

  Widget _createLanguageDropDown() {
    return DropdownButton<String>(
      iconSize: 30,
      hint: Text(lang(Get.context!).selectLanguage),
      onChanged: (language) {
        debugPrint('Language===> $language');
        if (language != null) {
          MyApp.setLocaleByLanguageCode(Get.context!, language);
        }
      },
      items: languages.keys
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(e, style: const TextStyle(fontSize: 20)),
                  Text(languages[e] ?? '')
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
