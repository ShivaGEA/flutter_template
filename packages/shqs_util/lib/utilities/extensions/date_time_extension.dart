extension ShqsDateTime on DateTime {
  String fromDateUTCTimeZone() {
    final utcDateTime = toUtc();
    final fromDate = DateTime.utc(utcDateTime.year, utcDateTime.month, utcDateTime.day);
    return fromDate.toIso8601String();
  }

  String toDateUTCTimeZone(){
    final utcDateTime = toUtc();
    final toDate = DateTime.utc(utcDateTime.year, utcDateTime.month, utcDateTime.day, 23, 59, 59, 999, 999);
    return toDate.toIso8601String();
  }
}