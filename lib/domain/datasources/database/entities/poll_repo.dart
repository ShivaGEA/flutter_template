import 'package:floor/floor.dart';

import '../../../models/user.dart';
import 'poll_options.dart';
import 'tags.dart';

@entity
class Poll {
  @primaryKey
  late final int id;
  int? pollId;
  String? title;
  String? image;
  DateTime? createdAt;
  User? createdBy;
  Tags? tags;
  PollOptions? pollOptions;

  Poll({
    this.pollId,
    this.title,
    this.image,
    this.createdAt,
    this.createdBy,
    this.tags,
    this.pollOptions,
  });

  Poll.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    pollId = json['id'] ?? 0;
    title = json['title'];
    image = json['image'];
    createdBy = validUser(json['createdBy']);
    createdAt = json['createdAt'];
    tags = Tags.fromJson(json['tags']);
    pollOptions = PollOptions.fromJson(json['options']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = pollId;
    map['title'] = title;
    map['image'] = image;
    map['createdBy'] = createdBy;
    map['createdAt'] = createdAt;
    map['tags'] = tags;
    map['options'] = pollOptions;
    return map;
  }

  User? validUser(json) => json != null ? User.fromJson(json) : null;
}
