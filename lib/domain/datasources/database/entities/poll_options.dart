import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class PollOption {
  @primaryKey
  late final int id;
  int? optionId;
  String? name;
  String? image;
  int? noOfVotes;

  PollOption({required this.optionId, this.name, this.image, this.noOfVotes});

  PollOption.fromJson(dynamic json) {
    //print('===>$json');
    id = json['id'] ?? 0;
    optionId = json['id'] ?? 0;
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    noOfVotes = json['no_of_votes'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = optionId ?? 0;
    map['name'] = name ?? '';
    map['image'] = image ?? '';
    map['no_of_votes'] = noOfVotes ?? '';
    return map;
  }
}

class PollOptions {
  List<PollOption> list = [];
  PollOptions(this.list);

  PollOptions.fromJson(dynamic json) {
    //print(json);
    list.clear();
    if (json is List)
      for (var item in json) list.add(PollOption.fromJson(item));
  }

  String toJson() {
    final array = [];
    list.forEach((element) {
      array.add(element.toJson());
    });
    return jsonEncode(list);
  }
}
