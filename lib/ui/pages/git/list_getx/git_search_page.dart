import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/ui/widgets/bottom_loader.dart';
import 'package:template/ui/widgets/language_selection_dropdown.dart';
import 'package:template/ui/widgets/loader.dart';
import 'package:template/ui/widgets/theme_selection_widget.dart';

import '../../../../app.dart';
import 'git_search_controller.dart';
import 'git_search_event.dart';
import 'git_search_state.dart';

class GitPage extends GetView<GitSearchController> {
  final _controller = Get.put(GitSearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: _controller,
        builder: (GitSearchController controller) => ui(controller));
  }

  Widget ui(GitSearchController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.search),
        actions: [
          ThemeSelectionWidget((theme, type) {
            Get.find<MyAppController>().setTheme(theme);
            Get.back();
          }),
          LanguageSelectionDropDown(),
        ],
      ),
      body: Obx(() => _body(controller.state.value)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onEvent(GitPageReloadEvent());
        },
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _listing({required List<GitRepo> list, state: GitPageLoadedState}) {
    if (list.length > 0)
      return ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (context, i) =>
            i < list.length ? _listItem(list[i], i) : _loadMore(state),
      );
    else
      return _loader();
  }

  Widget _listItem(GitRepo repo, int index) => Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        color: Colors.black12,
        child: Text(
          "${index + 1}: " +
              (repo.name ?? '') +
              "(" +
              (repo.fullName ?? '') +
              ") " +
              "\nUrl: " +
              (repo.url ?? '') +
              "\nDescription: " +
              (repo.description ?? ''),
        ),
      );

  Widget _body(GitPageState state) {
    debugPrint("==>body state: $state");
    if (state is GitPageLoadedState) {
      return _listing(list: state.list ?? [], state: state);
    } else if (state is GitPageLoadingState)
      return _loader();
    else if (state is GitPageInitialState)
      return Container(child: Center(child: Text("Init screen")));
    else
      return _listing(list: [], state: state);
  }

  Widget _loader() => Loader();

  Widget _loadMore(GitPageLoadedState state) =>
      BottomLoader(state is GitPageLoadMoreState, () {
        controller.onEvent(GitPageLoadMoreEvent());
      });
}
