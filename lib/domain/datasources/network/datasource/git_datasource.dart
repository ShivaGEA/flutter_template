import 'package:dartz/dartz.dart';

import '../../../../domain/datasources/database/entities/git_repo.dart';
import '../../../../domain/datasources/network/response/git_search_response.dart';
import '../base_datasource.dart';
import '../response/feature_response.dart';

abstract class GitDataSource {
  Future<Either<List<GitRepo>, Message>> repositories();
  Future<Either<GitSearchResponse, Message>> search1(String searchTerm);
  Future<Either<FeatureResponse, Message>> features(
      String sku, String data, int retryCount);
}
