import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template/config/localization/lang/language.dart';

import '../../app.dart';

class LanguageSelectionDropDown extends StatelessWidget {
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return _createLanguageDropDown();
  }

  Widget _createLanguageDropDown() {
    return DropdownButton<String>(
      iconSize: 30,
      hint: Text(lang.selectLanguage),
      onChanged: (language) {
        debugPrint('Language===> $language');
        if (language != null) {
          //Get.find<MyAppController>().setLocaleByLanguageCode(language);
          MyApp.of(context)?.setLocaleByLanguage(language);
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
