import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/data/datasources/network/response/api_response.dart';


class GitSearchResponse extends ApiResponse {
  List<GitRepo>? data;

  GitSearchResponse.fromJson(Map<String, dynamic> map) : super.fromJson(map)  {
    data = [];
    var parsed = map['repositories'] as List<dynamic>;
    for (var item in parsed) {
      var val = GitRepo.fromJson(item);
      data!.add(val);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['repositories'] = data;
    return json;
  }
}