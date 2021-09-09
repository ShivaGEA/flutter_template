import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/config/localization/lang/language.dart';

import '../../main.dart';

class LanguageSelectionDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _createLanguageDropDown();

  Widget _createLanguageDropDown() {
    return DropdownButton<String>(
      iconSize: 30,
      hint: Text(lang.selectLanguage),
      onChanged: (language) {
        print("Language===> $language");
        if (language != null)
          Get.find<MyAppController>().setLocaleByLanguageCode(language);
      },
      items: languages.keys
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(e, style: TextStyle(fontSize: 20)),
                  Text(languages[e] ?? '')
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
