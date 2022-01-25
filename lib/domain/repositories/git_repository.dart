import 'package:dartz/dartz.dart';

import '../../domain/datasources/database/entities/git_repo.dart';
import '../datasources/network/base_datasource.dart';

abstract class GitRepository {
  Future<Either<List<GitRepo>, Message>> repositories();
}
