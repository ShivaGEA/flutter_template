import '../../../../domain/datasources/database/entities/git_repo.dart';
import 'api_response.dart';

class GitSearchResponse extends ApiResponse {
  List<GitRepo>? data;

  GitSearchResponse.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    data = [];
    final parsed = map['repositories'] as List<dynamic>;
    for (var item in parsed) {
      final val = GitRepo.fromJson(item);
      data!.add(val);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['repositories'] = data;
    return json;
  }
}
