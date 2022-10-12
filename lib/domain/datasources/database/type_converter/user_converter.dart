import 'package:floor/floor.dart';

import '../../../models/user.dart';

class UserConverter extends TypeConverter<User, String> {
  @override
  User decode(String data) => User.fromJson(data);

  @override
  String encode(User user) => user.toJson().toString();
}
