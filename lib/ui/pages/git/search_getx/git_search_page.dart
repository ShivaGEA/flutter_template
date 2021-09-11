import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:template/config/localization/lang/language.dart';
import 'package:template/config/theme/theme.dart';
import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/main.dart';
import 'package:template/ui/pages/git/search_getx/git_search_event.dart';

import 'git_search_controller.dart';
import 'git_search_state.dart';

class GitPage extends GetView<GitSearchController> {
  final controller = Get.put(GitSearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (GitSearchController controller) => ui(controller));
  }

  Widget ui(GitSearchController controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.search),
        actions: [
          _themeToggle(),
          _createLanguageDropDown(),
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
    print("==>body state: $state");
    if (state is GitPageLoadedState) {
      return _listing(list: state.list ?? [], state: state);
    } else if (state is GitPageLoadingState)
      return _loader();
    else if (state is GitPageInitialState)
      return Container(child: Center(child: Text("Init screen")));
    else
      return _listing(list: [], state: state);
  }

  Widget _loader() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text(lang.loading),
          ],
        ),
      );

  Widget _loadMore(GitPageLoadedState state) {
    return state is GitPageLoadMoreState
        ? Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              controller.onEvent(GitPageLoadMoreEvent());
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(lang.loadMore),
              ),
            ),
          );
  }

  Widget _createLanguageDropDown() {
    return DropdownButton<String>(
      iconSize: 30,
      hint: Text(lang.selectLanguage),
      onChanged: (language) {
        print("Language===> $language");
        if (language != null)
          Get.find<MyAppController>().setLocaleByLanguageCode(language);
      },
      items: languages.keys
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(e, style: TextStyle(fontSize: 20)),
                  Text(languages[e] ?? '')
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _themeToggle() {
    return Container(
      height: 25,
      width: 25,
      margin: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          _showThemeDialog();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedTheme.theme.accentColor,
            border: Border.all(
              width: 2,
              color: Colors.black45,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Theme"),
          content: Container(
            height: 300.0, // Change as per your requirement
            width: 300.0,
            child: _themesList(),
          ),
        );
      },
    );
  }

  Widget _dialogItem(ThemeType themeType) {
    var theme = MyTheme.getTheme(themeType);
    return InkWell(
      onTap: () {
        Get.find<MyAppController>().setTheme(theme);
        Get.back();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.theme.accentColor,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            Text(theme.name)
          ],
        ),
      ),
    );
  }

  Widget _themesList() {
    var list = ThemeType.values;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) => _dialogItem(list[index]),
    );
  }
}
