import 'dart:convert';

import 'package:floor/floor.dart';

import '../entities/tags.dart';

class TagsConverter extends TypeConverter<Tags, String> {
  @override
  Tags decode(String data) => tags(data);

  @override
  String encode(Tags tags) => tags.toJson();

  Tags tags(String data) {
    var list = <Tag>[];
    if (data is List) {
      list =
          (jsonDecode(data) as List).map((json) => Tag.fromJson(json)).toList();
    } else {
      if (jsonDecode(data) is List) {
        list = (jsonDecode(data) as List)
            .map((json) => Tag.fromJson(json))
            .toList();
      }
    }
    return Tags(list);
  }
}
