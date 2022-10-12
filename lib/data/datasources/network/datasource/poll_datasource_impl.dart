import 'package:dartz/dartz.dart';

import '../../../../domain/datasources/database/entities/poll_repo.dart';
import '../../../../domain/datasources/network/base_datasource.dart';
import '../../../../domain/datasources/network/response/polls_response.dart';
import '../../../../domain/datasources/samples/poll_sample.dart';

class PollDataSourceImpl {
  Future<Either<List<Poll>, Message>> repositories() async {
    final data = PollResponse.fromJson(polls_sample_data).data ?? [];
    return Left(data);
  }
}
