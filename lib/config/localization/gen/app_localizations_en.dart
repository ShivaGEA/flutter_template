


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get frieghtInRs => 'Freight (Rs)';

  @override
  String gst(String rate) {
    return 'GST ($rate%) (Rs)';
  }

  @override
  String get language => 'English';

  @override
  String get total => 'Total';

  @override
  String get name => 'Name';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get loadMore => 'Load More';

  @override
  String get search => 'Search';

  @override
  String get loading => 'Loading...';

  @override
  String get theme => 'Theme';
}
