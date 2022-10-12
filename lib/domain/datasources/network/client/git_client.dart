import '../../../../domain/datasources/database/entities/git_repo.dart';
import '../response/feature_response.dart';

abstract class GitClient {
  Future<List<GitRepo>> repositories();
  Future<GitRepo> search();
  Future<FeatureResponse> features(
    String sku,
    String data,
    int retryCount,
  );
}
