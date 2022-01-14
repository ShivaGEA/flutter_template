// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child user_interface.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template/config/env/env.dart';
import 'package:template/config/theme/theme.dart';
import 'package:template/locator.dart';

void main() {
  test("Init Test", () async {
    await setupLocator();
  });

  test("Environment Test", () async {
    var env = await Environment.get();
    assert(env.name == BuildType.DEV.toString());

    env = await Environment.set(BuildType.DEV);
    assert(env.name == BuildType.DEV.toString());

    env = await Environment.set(BuildType.QA);
    assert(env.name == BuildType.QA.toString());

    env = await Environment.set(BuildType.UAT);
    assert(env.name == BuildType.UAT.toString());

    env = await Environment.set(BuildType.PROD);
    assert(env.name == BuildType.PROD.toString());
  });

  test("Theme Test", () async {
    var theme = await MyTheme.get();
    assert(theme.name == ThemeType.LIGHT.toString());

    theme = await MyTheme.set(ThemeType.LIGHT);
    assert(theme.name == ThemeType.LIGHT.toString());

    theme = await MyTheme.set(ThemeType.DARK);
    assert(theme.name == ThemeType.DARK.toString());
  });

  test('New Line Character Elimination Test', () async {
    var mockData = <String>[
      '1) Check for proper installation and proper standpipe height\\n2) Check '
          'drain filter for blockage. Clean.\\n3) Check pressure sensor frequency'
          ' (Hz) and pressure sensor hose.\\n4) Check resistance of the drain '
          'pump and voltage to the pump. 120VAC.\\n5) If voltage is present '
          'and the pump does not operate, replace pump.\\n6) If voltage is '
          'not present, check harness and connectors.\\n7) If harness and '
          'connector are good, replace the main control board.\\n\t\t',
      '',
      '1) Check to make leveled. \\\\\\n2) Run Drain and Spin\\\\\n3) Check that basket  '
          '\\n4) https://www.youtube.com/embed/emzSusPs_2I?rel=0 #/hr#'
          '\\n5) Check the basket for excessive friction '
          '\\\\\\n6) Check for balance ring damage, tub damage '
          '\\n7) Proper water level is required for re-distribute prior to final spin.'
          '\\n9) Educate consumer on OOB/random re-distribute of loads \\n\\n\t\t'
    ];

    var exprs = {
      '\\\\n': '\n',
      '\\n': '\n',
      //'\n':'\n',
      '\t': '',
      '\r': '',
      //'\\\\\\\\':'',
      '\\\\': '',
      //'\\':'',
    };

    mockData.forEach((element) {
      exprs.forEach((expr, replace) {
        element = element.replaceAll(RegExp(expr), replace);
      });
      element = element.replaceAll(new RegExp(r'\\'), '');
      debugPrint(element);
    });
  });
}
