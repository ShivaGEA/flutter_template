import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Tag {
  @primaryKey
  late final int id;
  int? tagId;
  String? name;

  Tag(this.tagId, this.name);

  Tag.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    tagId = json['id'] ?? 0;
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = tagId ?? 0;
    map['name'] = name ?? '';
    return map;
  }
}

class Tags {
  List<Tag> list = [];
  Tags(this.list);

  Tags.fromJson(dynamic json) {
    list.clear();
    if (json is List) for (var item in json) list.add(Tag.fromJson(item));
  }

  String toJson() {
    final array = [];
    list.forEach((element) {
      array.add(element.toJson());
    });
    return jsonEncode(list);
  }
}
