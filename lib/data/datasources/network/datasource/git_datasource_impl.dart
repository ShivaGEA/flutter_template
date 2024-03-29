import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '/config/env/env.dart';
import '../../../../data/datasources/network/client/git_client_impl.dart';
import '../../../../domain/datasources/database/entities/git_repo.dart';
import '../../../../domain/datasources/network/base_datasource.dart';
import '../../../../domain/datasources/network/datasource/git_datasource.dart';
import '../../../../domain/datasources/network/response/feature_response.dart';
import '../../../../domain/datasources/network/response/git_search_response.dart';
import '../../../../domain/enum/network_request.dart';

class GitDataSourceImpl extends BaseDataSource implements GitDataSource {
  GitClientImpl client;

  GitDataSourceImpl(this.client);

  @override
  Future<Either<List<GitRepo>, Message>> repositories() =>
      getResult(client.repositories());

  @override
  Future<Either<FeatureResponse, Message>> features(
          String sku, String data, int retryCount) =>
      getResult(client.features(sku, data, retryCount));

  @override
  Future<Either<GitSearchResponse, Message>> search1(String searchTerm) =>
      request(
        type: NetworkRequest.POST,
        url: Get.find<Environment>().baseUrl,
        data: {'language': searchTerm},
        headers: {},
      );
}
