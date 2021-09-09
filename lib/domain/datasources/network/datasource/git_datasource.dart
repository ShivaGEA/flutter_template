
abstract class GitDataSource  {
  Future<dynamic> repositories() ;
  Future<dynamic> search1(String searchTerm) ;
}