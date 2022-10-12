import 'package:dartz/dartz.dart';

import '../../domain/datasources/database/entities/git_repo.dart';
import '../datasources/network/base_datasource.dart';
import '../datasources/network/response/feature_response.dart';

abstract class GitRepository {
  Future<Either<List<GitRepo>, Message>> repositories();
  Future<Either<FeatureResponse, Message>> features(
      String sku, String data, int retryCount);
}
