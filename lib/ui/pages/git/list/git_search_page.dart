import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/config/localization/language.dart';
import '/config/routes.dart';
import '/domain/datasources/database/entities/git_repo.dart';
import '/ui/widgets/bottom_loader.dart';
import '/ui/widgets/language_selection_dropdown.dart';
import '/ui/widgets/loader.dart';
import '/ui/widgets/theme_selection_widget.dart';
import '../../../../app.dart';
import '../../../../utilities/string_extension.dart';
import '../../../widgets/circle_image.dart';
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            lang(context).search,
          ),
          actions: [
            ThemeSelectionWidget((theme, type) {
              Get.find<MyAppController>().setTheme(theme);
              Get.back();
            }),
            LanguageSelectionDropDown(),
          ],
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _bloc!..add(GitReloadEvent());
          },
          tooltip: lang(context).refresh,
          label: Text(lang(context).refresh),
          icon: const Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );

  Widget _listing({required List<GitRepo> list, state = GitLoadedState}) {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: list.length + 1,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) => i < list.length
            ? _listItem(list[i], i)
            : Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: _loadMore(state),
              ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                repo.name?.toTitleCase() ?? '',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(repo.description ?? ''),
              _richtext(repo),
              const Padding(padding: EdgeInsets.all(2.0)),
              _userInfo(repo.ownerName, repo.ownerImage ?? '')
            ],
          ),
        ),
      );

  Widget _body() {
    return BlocProvider<GitSearchBloc>(
        create: (context) => _bloc!,
        child: BlocBuilder<GitSearchBloc, GitSearchState>(
            builder: (BuildContext context, GitSearchState state) {
          //debugPrint('state==> $state');
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

  Widget _userInfo(String? ownerName, String ownerImage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(url: ownerImage, size: 10),
        const Padding(padding: EdgeInsets.all(2.0)),
        Text(ownerName?.toTitleCase() ?? '')
      ],
    );
  }

  Widget _richtext(GitRepo repo) => RichText(
          text: TextSpan(
        children: <TextSpan>[
          const TextSpan(
              text: 'Repo Url: ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(
              text: '${repo.url ?? ''}',
              style: const TextStyle(color: Colors.black)),
        ],
      ));
}
