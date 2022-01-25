import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/datasources/database/entities/git_repo.dart';
import '../../domain/datasources/network/base_datasource.dart';
import '../../domain/repositories/base_repository.dart';
import '../../domain/repositories/git_repository.dart';
import '../datasources/database/dao/git_repository_dao_impl.dart';
import '../datasources/network/datasource/git_datasource_impl.dart';

class GitRepositoryImpl extends BaseRepository implements GitRepository {
  final _gitDataSource = Get.find<GitDataSourceImpl>();
  final _repositoryDao = Get.find<GitRepositoryDaoImpl>();

  @override
  Future<Either<List<GitRepo>, Message>> repositories() async {
    final resp = await _gitDataSource.repositories();
    return resp.fold((l) {
      //store data into local database(floor)
      try {
        _repositoryDao.insertRepositories(l);
      } catch (e) {
        if (e is DatabaseException) {
          _repositoryDao.updateRepositories(l);
        }
      }
      //return expected result to Controller to update the UI
      return Left(l);
    }, (r) => Right(r));
  }
}
