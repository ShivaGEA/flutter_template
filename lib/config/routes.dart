import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/pages/dashboard/polls_page.dart';
import '../ui/pages/git/list/git_search_page.dart';
import '../ui/pages/git/list_getx/git_search_page.dart';
import '../ui/pages/home/home_page.dart';

class Routes {
  static const splash = '/splash-screen';
  static const poll = '/polls';
  static const gitSearch = '/git-search';
  static const gitSearchGetX = '/git-search-getx';
  static const home = '/home';

  static List<GetPage> get pages => [
        GetPage(
          name: poll,
          page: () => PollsPage(),
        ),
        GetPage(
          name: gitSearch,
          page: () => GitSearchPage(),
        ),
        GetPage(
          name: gitSearchGetX,
          page: () => GitPage(),
        ),
        GetPage(
          name: home,
          page: () => HomePage(),
        ),
      ];
}
