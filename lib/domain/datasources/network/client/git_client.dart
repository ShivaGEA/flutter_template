import '../../../../domain/datasources/database/entities/git_repo.dart';

abstract class GitClient {
  Future<List<GitRepo>> repositories();
  Future<GitRepo> search();
}
