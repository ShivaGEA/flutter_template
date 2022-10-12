/*
class FeatureResponse extends ApiResponse {
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
*/

class Feature {
  final String data;
  Feature(this.data);

  factory Feature.fromJson(String data) {
    return Feature(data);
  }
}

class FeatureResponse {
  List<Feature> features = [];

  FeatureResponse(this.features);

  factory FeatureResponse.fromJson(Map<String, dynamic> data) {
    final list = <Feature>[];

    print(data['body']);
    (data['body'] as List).forEach((element) {
      list.add(Feature.fromJson(element.toString()));
    });

    return FeatureResponse(list);
  }
}
