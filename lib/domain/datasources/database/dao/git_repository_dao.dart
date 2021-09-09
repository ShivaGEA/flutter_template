

import 'package:template/domain/datasources/database/entities/git_repo.dart';

abstract class GitRepositoryDao{

  Future<List<GitRepo>> findAllRepositories();

  Stream<List<GitRepo>> findAllRepositoriesAsStream();

  Future<void> insertRepository(GitRepo repository);

  Future<void> insertRepositories(List<GitRepo> repositories);

  Future<void> updateRepository(GitRepo repository);

  Future<void> updateRepositories(List<GitRepo> repository);

  Future<void> deleteRepository(GitRepo repository);

  Future<void> deleteRepositories(List<GitRepo> repositories);
}