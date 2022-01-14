// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child user_interface.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shqs_util/shqs_util.dart';

void main() {
  test('logger test', () async {
    var history = await GeLog.history();
    debugPrint('history size: ${history.length}');

    for (var index = 0; index <= 10; index++) {
      GeLog.d('debug', 'test $index');
    }

    for (var index = 0; index <= 10; index++) {
      GeLog.w('warn', 'test $index');
    }

    for (var index = 0; index <= 10; index++) {
      GeLog.e('error', 'test $index',
          exception: Exception('create exception for testing'));
    }

    history = await GeLog.history();
    equals(33, history.length);

    var deb = await GeLog.history(filter: 'debug');
    equals(11, deb.length);

    var warn = await GeLog.history(filter: 'warn');
    equals(11, warn.length);

    var error = await GeLog.history(filter: 'error');
    equals(11, error.length);

    GeLog.d('name', 'history: ${history.length}');

    // GeLog.clear();
    // // history = await GeLog.history();
    // equals(0, history.length);

    GeLog.d('name', 'current level: ${GeLog.logLevel.level}');

    GeLog.d('pretty', '{"code":"0","text":"hello world"}'.pretty());
    GeLog.d('pretty',
        '{"code":["0","1","2","3","4"],"text":"hello world"}'.pretty());

    GeLog.e('error', 'test', error: ArgumentError('ArgumentError'));
    GeLog.e('error', 'test', error: AssertionError('AssertionError'));
    GeLog.e('error', 'test', exception: Exception('Exception'));

    // Extension test
    'Log test'.d(tag: 'TEST');

    expect('Verbose'.v().length, 7);
    expect('Debug'.d().length, 5);
    expect('Info'.i().length, 4);
    expect('Warn'.w().length, 4);
    expect('Error'.e().length, 5);

    GeLog.setProperty(
        verbose: AnsiColor.grey,
        debug: AnsiColor.magenta,
        info: AnsiColor.blue,
        warn: AnsiColor.cyan,
        error: AnsiColor.yellow);

    'verbose'.v();
    'debug'.d();
    'info'.i();
    'warn'.w();
    'error'.e();

    await GeLog.save();
  });

  test('InsecureSharedPreferences test', () async {
    SharedPreferences.setMockInitialValues({});

    final insecure =
        await ShqsSharedPreferencesProvider.createInSequrePreference();

    final isSetBool = await insecure.setBool('boolTest', true);
    GeLog.d('SharedPreferences test', 'boolTest save: $isSetBool');
    expect(insecure.getBool('boolTest'), true);

    final isSetInt = await insecure.setInt('intTest', 325);
    GeLog.d('SharedPreferences test', 'intTest save: $isSetInt');
    expect(insecure.getInt('intTest'), 325);

    final isSetDouble = await insecure.setDouble('doubleTest', 32.5);
    GeLog.d('SharedPreferences test', 'doubleTest save: $isSetDouble');
    expect(insecure.getDouble('doubleTest'), moreOrLessEquals(32.5));

    final isSetString = await insecure.setString('stringTest', '32.5');
    GeLog.d('SharedPreferences test', 'stringTest save: $isSetString');
    expect(insecure.getString('stringTest'), '32.5');

    final listSample = ['a', 'b', 'c'];
    final isSetStringList =
        await insecure.setStringList('stringListTest', listSample);
    GeLog.d('SharedPreferences test', 'stringListTest save: $isSetStringList');
    final loadedList = insecure.getStringList('stringListTest');
    expect(loadedList, listSample);

    final isAppendString =
        await insecure.appendToStringList('stringListTest', 'd');
    GeLog.d('SharedPreferences test',
        'appendToStringListText save: $isAppendString');
    final loadedList2 = insecure.getStringList('stringListTest');
    expect(loadedList2.length, 4);
    for (var item in loadedList2) {
      GeLog.d('SharedPreferences test', '$item is in loadedList2');
    }

    var containsBoolTest = await insecure.containsKey('boolTest');
    expect(containsBoolTest, true);
    final isRemoved = await insecure.remove('boolTest');
    expect(isRemoved, true);
    containsBoolTest = await insecure.containsKey('boolTest');
    expect(containsBoolTest, false);
  });

  test('SecureSharedPreferences test', () async {
    SharedPreferences.setMockInitialValues({});

    final secure =
        await ShqsSharedPreferencesProvider.createInSequrePreference();
    // final insecure = await InsecureSharedPreferences.instance;

    // bool test
    final isSetBool = await secure.setBool('boolTest', true);
    expect(isSetBool, true);
    expect(secure.getBool('boolTest'), true);

    // int test
    final isSetInt = await secure.setInt('intTest', 325);
    expect(isSetInt, true);
    expect(secure.getInt('intTest'), 325);

    // double test
    final isSetDouble = await secure.setDouble('doubleTest', 32.5);
    expect(isSetDouble, true);
    expect(secure.getDouble('doubleTest'), moreOrLessEquals(32.5));

    // String test
    final isSetString =
        await secure.setString('stringTest', 'SecureSharedPreferences');
    expect(isSetString, true);
    /*final encrypted = insecure.getString('stringTest');
    GeLog.d('SecureSharedPreferences Test', '< $encrypted');
    if (encrypted != null) {
      expect(SecurityUtils.decrypt(encrypted), 'SecureSharedPreferences');
    } else {
      expect(true, false, reason: 'encrypted is null');
    }*/
    expect(secure.getString('stringTest'), 'SecureSharedPreferences');

    // String list test
    final listSample = [
      'SecureSharedPreferences-A',
      'SecureSharedPreferences-B',
      'SecureSharedPreferences-C'
    ];
    final isSetStringList =
        await secure.setStringList('stringListTest', listSample);
    expect(isSetStringList, true);
    //final encryptedList = insecure.getStringList('stringListTest');
    final loadedList = secure.getStringList('stringListTest');
    /*for (var index = 0; index < encryptedList.length; index++) {
      expect(SecurityUtils.decrypt(encryptedList[index]), listSample[index]);
    }*/
    expect(loadedList, listSample);

    // String append test
    final isAppendString = await secure.appendToStringList(
        'stringListTest', 'SecureSharedPreferences-D');
    expect(isAppendString, true);
    /*final loadedList2 = secure.getStringList('stringListTest');
    final encryptedList2 = insecure.getStringList('stringListTest');
    for (var index = 0; index < encryptedList2.length; index++) {
      expect(SecurityUtils.decrypt(encryptedList2[index]), loadedList2[index]);
    }*/

    // Contains test
    var containsBoolTest = await secure.containsKey('boolTest');
    expect(containsBoolTest, true);

    // Remove test
    final isRemoved = await secure.remove('boolTest');
    expect(isRemoved, true);
    containsBoolTest = await secure.containsKey('boolTest');
    expect(containsBoolTest, false);
  });

  test('SecurityUtils', () async {
    final source = [
      'Session ID: EXPORTED-LOG',
      'Model Number: GTD84ECSN0WS',
      'Serial Number: HM839308C',
      'Timestamp: 2021-04-06T18:15:58.808Z',
      'write 15 bytes: <6e400001 b5a3f393 c004e7a0 06f726>',
      'read 21 bytes(21) : <6e400001 b5a3f393 e50ac0a1 0200f726 04000000 00>'
    ];

    final encrypted = [
      'ZYE6omR1QSKYJgmHp7MVy2FObrMX7/yMEaGZpLAaVck=',
      '7Uenn9OWk5EnQOEnTbZudvssUKxMSnX+gMH6EuJSppY=',
      'djTLftR5PH7++TgWRL6uKv+4D2Z7FD4S6+StuLIMGtw=',
      '2uactr046L6xP68XEdnZR5Ak1wk0emwFx/snkKav+/7QHr9Kk2MUUYVAhE9LoMzm',
      'FXSDGoH42maHx7fZAua6Xodtdcjr5+srnBC6s9vk34N/Ycd0atdwiilzp62Rf5eq8AUi122V0IJ6FMLICfTUbg==',
      'sGA/pn1CQBIaPWqna1/fR0Xjj/6kiAtMDrtNrAak8UWhdBdCAVryxgNnTsn/NzsslvdjWZyH7CdaZPGWQY2tOLKDrKNwN2dINzNX+1layzo='
    ];

    GeLog.d('SecurityUtils', '----> Basic test');
    for (var index = 0; index < source.length; index++) {
      expect(SecurityUtils.encrypt(source[index]), encrypted[index]);
    }

    for (var index = 0; index < encrypted.length; index++) {
      expect(SecurityUtils.decrypt(encrypted[index]), source[index]);
    }

    GeLog.d('SecurityUtils', '----> Extension method test');
    for (var index = 0; index < source.length; index++) {
      GeLog.d('SecurityUtils', 'encrypt: ${source[index].encrypt()}');
      expect(source[index].encrypt(), encrypted[index]);
    }

    for (var index = 0; index < encrypted.length; index++) {
      GeLog.d('SecurityUtils', 'decrypt: ${encrypted[index].decrypt()}');
      expect(encrypted[index].decrypt(), source[index]);
    }
  });
}
