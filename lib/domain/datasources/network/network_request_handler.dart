import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:template/domain/enum/network_request.dart';

class NetworkHandler {
  final Dio _dio = Get.find<Dio>();

  dynamic processRequest(
      {required NetworkRequest type,
      required String url,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? data}) async {
    ArgumentError.checkNotNull(data, 'data');
    //const _extra = <String, dynamic>{};
    var queryParameters = <String, dynamic>{};
    var _data = <String, dynamic>{};

    if (type == NetworkRequest.GET) {
      queryParameters = data ?? <String, dynamic>{};
    } else if (type == NetworkRequest.POST) {
      _data = {'data': data};
      _data.removeWhere((k, v) => v == null);
    } else {}

    final _result = await _dio.request<Map<String, dynamic>>(url,
        queryParameters: queryParameters, data: _data);
    return _result.data;
  }
}
