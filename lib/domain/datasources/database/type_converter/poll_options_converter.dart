import 'dart:convert';

import 'package:floor/floor.dart';

import '../entities/poll_options.dart';

class PollOptionsConverter extends TypeConverter<PollOptions, String> {
  @override
  PollOptions decode(String data) => pollOptions(data);

  @override
  String encode(PollOptions options) => options.toJson();

  PollOptions pollOptions(String data) {
    var list = <PollOption>[];
    if (data is List) {
      list = (jsonDecode(data) as List)
          .map((json) => PollOption.fromJson(json))
          .toList();
    } else {
      if (jsonDecode(data) is List) {
        list = (jsonDecode(data) as List)
            .map((json) => PollOption.fromJson(json))
            .toList();
      }
    }

    return PollOptions(list);
  }
}
