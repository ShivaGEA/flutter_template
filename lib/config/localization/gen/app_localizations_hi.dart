import 'app_localizations.dart';

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get frieghtInRs => 'किराया (रु.)';

  @override
  String gst(String rate) {
    return 'जीएसटी ($rate%) (रु.)';
  }

  @override
  String get language => 'Hindi';

  @override
  String get total => 'कुल';

  @override
  String get name => 'नाम';

  @override
  String get selectLanguage => 'भाषा का चयन करे';

  @override
  String get loadMore => 'और लोड करें';

  @override
  String get search => 'खोज';

  @override
  String get loading => 'लोड हो रहा है';

  @override
  String get theme => 'थीम';

  @override
  String get refresh => 'पुनः लोड करें';
}
