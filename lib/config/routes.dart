import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:template/ui/pages/git/list/git_search_page.dart';
import 'package:template/ui/pages/git/list_getx/git_search_page.dart';

class Routes {
  static const splash = '/splash_screen';
  static const gitSearch = '/git_search';
  static const gitSearchGetX = '/git_search_getx';

  static get pages => [
        GetPage(name: gitSearch, page: () => GitSearchPage()),
        GetPage(name: gitSearchGetX, page: () => GitPage()),
      ];
}
