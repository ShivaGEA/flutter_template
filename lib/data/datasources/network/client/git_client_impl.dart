import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '/config/env/env.dart';
import '../../../../domain/datasources/database/entities/git_repo.dart';
import '../../../../domain/datasources/network/client/git_client.dart';
import '../../../../domain/datasources/network/response/feature_response.dart';

part 'git_client_impl.g.dart';

@RestApi()
abstract class GitClientImpl extends GitClient {
  factory GitClientImpl(Dio dio, {String baseUrl}) = _GitClientImpl;

  @override
  @GET(Environment.gitRepositories)
  Future<List<GitRepo>> repositories();

  @override
  @GET(Environment.gitSearch)
  Future<GitRepo> search();

  @override
  @GET(Environment.smartHqFeatures)
  Future<FeatureResponse> features(
    @Query('sku') String sku,
    @Query('data') String data,
    @Query('retry_count') int retryCount,
  );
}
