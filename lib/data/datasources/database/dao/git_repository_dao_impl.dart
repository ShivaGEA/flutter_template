import 'package:floor/floor.dart';

import '../../../../domain/datasources/database/dao/git_repository_dao.dart';
import '../../../../domain/datasources/database/entities/git_repo.dart';

@dao
abstract class GitRepositoryDaoImpl implements GitRepositoryDao {
  @override
  @Query('SELECT * FROM Repository')
  Future<List<GitRepo>> findAllRepositories();

  @override
  @Query('SELECT * FROM Repository')
  Stream<List<GitRepo>> findAllRepositoriesAsStream();

  @override
  @insert
  Future<void> insertRepository(GitRepo repository);

  @override
  @insert
  Future<void> insertRepositories(List<GitRepo> repositories);

  @override
  @update
  Future<void> updateRepository(GitRepo repository);

  @override
  @update
  Future<void> updateRepositories(List<GitRepo> repository);

  @override
  @delete
  Future<void> deleteRepository(GitRepo repository);

  @override
  @delete
  Future<void> deleteRepositories(List<GitRepo> repositories);
}
