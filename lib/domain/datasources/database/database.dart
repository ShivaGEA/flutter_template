import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:template/data/datasources/database/dao/git_repository_dao_impl.dart';

import 'entities/git_repo.dart';

part 'database.g.dart';

@Database(version: 1, entities: [
  GitRepo,
])
abstract class AppDataBase extends FloorDatabase {
  GitRepositoryDaoImpl get repositoryDao;
}
