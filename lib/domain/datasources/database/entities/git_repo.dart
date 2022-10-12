import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class GitRepo {
  @primaryKey
  late final int id;
  String? fullName;
  String? name;
  String? owner;
  String? ownerName;
  String? ownerImage;
  String? description;
  String? url;

  GitRepo(
    this.id,
    this.name,
    this.fullName,
    this.owner,
    this.description,
    this.url,
  );

  GitRepo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = jsonEncode(json['owner']);
    ownerName = json['owner']['login'];
    ownerImage = json['owner']['avatar_url'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['full_name'] = fullName;
    map['owner'] = owner != null ? jsonDecode(owner!) : null;
    map['description'] = description;
    map['url'] = url;
    return map;
  }
}
