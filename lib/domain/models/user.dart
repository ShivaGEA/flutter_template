class User {
  String? name;
  String? photo;
  int? id;

  User(this.id, this.name, this.photo);

  User.fromJson(dynamic json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    photo = json['photo'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id ?? '';
    map['name'] = name ?? '';
    map['photo'] = photo ?? '';
    return map;
  }
}
