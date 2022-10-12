import 'app_localizations.dart';

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

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
  String get name => 'పేరు';

  @override
  String get selectLanguage => 'భాష ఎంచుకొను';

  @override
  String get loadMore => 'మరిన్ని లోడ్ చేయి';

  @override
  String get search => 'వెతకండి';

  @override
  String get loading => 'లోడ్...';

  @override
  String get theme => 'థీమ్';

  @override
  String get refresh => 'మళ్లీ లోడ్ చేయండి';
}
