import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:template/data/datasources/database/dao/git_repository_dao_impl.dart';
import 'package:template/data/datasources/network/base_datasource.dart';
import 'package:template/data/datasources/network/datasource/git_datasource_impl.dart';
import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/domain/repositories/base_repository.dart';
import 'package:template/domain/repositories/git_repository.dart';

class GitRepositoryImpl extends BaseRepository implements GitRepository {
  var _gitDataSource = Get.find<GitDataSourceImpl>();
  var _repositoryDao = Get.find<GitRepositoryDaoImpl>();

  @override
  Future<Either<List<GitRepo>, Message>> repositories() async {
    var resp = await _gitDataSource.repositories();
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
