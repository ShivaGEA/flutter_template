import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:template/config/env/env.dart';
import 'package:template/data/datasources/network/client/git_client_impl.dart';
import 'package:template/data/datasources/network/response/git_search_response.dart';
import 'package:template/data/enum/network_request.dart';
import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/domain/datasources/network/datasource/git_datasource.dart';

import '../base_datasource.dart';

class GitDataSourceImpl extends BaseDataSource implements GitDataSource {
  GitClientImpl apiClient;

  GitDataSourceImpl(this.apiClient);

  Future<Either<List<GitRepo>, Message>> repositories() async {
    return await getResult(apiClient.repositories());
  }

  Future<Either<GitSearchResponse, Message>> search1(String searchTerm) async =>
      await request(
          type: NetworkRequest.POST,
          url: Get.find<Environment>().baseUrl,
          data: {'language': searchTerm},
          headers: {});
}
