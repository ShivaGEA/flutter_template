import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/pages/git/list/git_search_page.dart';
import '../ui/pages/git/list_getx/git_search_page.dart';

class Routes {
  static const splash = '/splash-screen';
  static const gitSearch = '/git-search';
  static const gitSearchGetX = '/git-search-getx';

  static List<GetPage> get pages => [
        GetPage(
          name: gitSearch,
          page: () => GitSearchPage(),
        ),
        GetPage(
          name: gitSearchGetX,
          page: () => GitPage(),
        ),
      ];
}
