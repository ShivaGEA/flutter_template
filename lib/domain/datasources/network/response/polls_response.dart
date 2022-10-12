import '../../database/entities/poll_repo.dart';
import 'api_response.dart';

class PollResponse extends ApiResponse {
  List<Poll>? data;

  PollResponse.fromJson(Map<String, dynamic> map) : super.fromJson(map) {
    data = [];
    final parsed = map['polls'] as List<dynamic>;
    for (var item in parsed) if (item != null) data!.add(Poll.fromJson(item));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['repositories'] = data;
    return json;
  }
}
