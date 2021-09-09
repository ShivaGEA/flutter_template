import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/domain/datasources/network/client/git_client.dart';

part 'git_client_impl.g.dart';

@RestApi()
abstract class GitClientImpl extends GitClient {
  factory GitClientImpl(Dio dio, {String baseUrl}) = _GitClientImpl;

  @override
  @GET("/repositories")
  Future<List<GitRepo>> repositories();

  @override
  @GET("/search1")
  Future<GitRepo> search1();
}
