import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:template/config/routes.dart';
import 'package:template/domain/datasources/database/entities/git_repo.dart';
import 'package:template/ui/widgets/bottom_loader.dart';
import 'package:template/ui/widgets/language_selection_dropdown.dart';
import 'package:template/ui/widgets/loader.dart';
import 'package:template/ui/widgets/theme_selection_widget.dart';

import '../../../../app.dart';
import 'git_search_bloc.dart';
import 'git_search_event.dart';
import 'git_search_state.dart';

class GitSearchPage extends StatefulWidget {
  @override
  _GitSearchPageState createState() => _GitSearchPageState();
}

class _GitSearchPageState extends State<GitSearchPage> {
  GitSearchBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GitSearchBloc();
    _bloc!..add(GitLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: lText(lang(context).search),
        actions: [
          ThemeSelectionWidget((theme, type) {
            Get.find<MyAppController>().setTheme(theme);
            Get.back();
          }),
          LanguageSelectionDropDown(),
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc!..add(GitReloadEvent());
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _listing({required List<GitRepo> list, state = GitLoadedState}) {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (context, i) =>
            i < list.length ? _listItem(list[i], i) : _loadMore(state),
      );
    } else {
      return _loader();
    }
  }

  Widget _listItem(GitRepo repo, int index) => InkWell(
        onTap: () {
          Get.toNamed(Routes.gitSearchGetX);
        },
        child: Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.black12,
            child: Text('${index + 1}: ' +
                (repo.name ?? '') +
                '(' +
                (repo.fullName ?? '') +
                ') ' +
                '\nUrl: ' +
                (repo.url ?? '') +
                '\nDescription: ' +
                (repo.description ?? ''))),
      );

  Widget _body() {
    return BlocProvider<GitSearchBloc>(
        create: (context) => _bloc!,
        child: BlocBuilder<GitSearchBloc, GitSearchState>(
            builder: (BuildContext context, GitSearchState state) {
          debugPrint('state==> $state');
          if (state is GitLoadedState) {
            return _listing(list: state.list ?? [], state: state);
          } else if (state is GitLoadingState) {
            return _loader();
          } else {
            if (state is GitInitialState) {
              return Container(child: const Center(child: Text('Init screen')));
            } else {
              return _listing(list: [], state: state);
            }
          }
        }));
  }

  Widget _loader() => Loader();

  Widget _loadMore(GitLoadedState state) =>
      BottomLoader(state is GitLoadMoreState, () {
        _bloc!..add(GitLoadMoreEvent());
      });
}

Text lText(search) => Text(search);
