import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/config/localization/language.dart';
import '../../config/theme/theme.dart';

typedef OnThemeSelect = void Function(MyTheme theme, ThemeType type);

class ThemeSelectionWidget extends StatelessWidget {
  final OnThemeSelect? onThemeSelected;

  ThemeSelectionWidget(this.onThemeSelected);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showThemeDialog();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.black45,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(4.0)),
              Text(
                lang(context).theme,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            lang(context).selectLanguage,
          ),
          content: Container(
            height: 300.0, // Change as per your requirement
            width: 200.0,
            child: _themesList(),
          ),
        );
      },
    );
  }

  Widget _dialogItem(ThemeType themeType) {
    final theme = MyTheme.getTheme(themeType);
    return InkWell(
      onTap: () {
        if (onThemeSelected != null) onThemeSelected!(theme, themeType);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            Text(theme.name)
          ],
        ),
      ),
    );
  }

  Widget _themesList() {
    const list = ThemeType.values;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) => _dialogItem(list[index]),
    );
  }
}
