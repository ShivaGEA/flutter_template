import 'package:get/get.dart';
import 'package:template/data/repositories/git_repository_impl.dart';

import 'git_search_event.dart';
import 'git_search_state.dart';

class GitSearchController extends GetxController {
  Rx<GitPageState> state = _defaultState.obs;
  final _gitRepository = Get.find<GitRepositoryImpl>();
  static GitPageState get _defaultState => GitPageInitialState();

  @override
  void onInit() {
    print("init=> ");
    onEvent(GitPageLoadEvent());
    super.onInit();
  }

  void onEvent(GitPageEvent event) async {
    print('Event==> $event  ${state.value}');
    if (event is GitPageLoadMoreEvent)
      await loadMoreEvent();
    else if (event is GitPageLoadEvent)
      await gitPageLoadEvent();
    else if (event is GitPageReloadEvent)
      await gitPageReloadEvent();
    else {}
  }

  Future<void> loadMoreEvent() async {
    if (state.value is GitPageLoadedState) {
      var list = (state.value as GitPageLoadedState).list;
      state.value = GitPageLoadMoreState(list: list);
      final resp = await _gitRepository.repositories();
      state.value = resp.fold(
        (l) {
          list = [...list ?? [], ...l];
          return GitPageLoadedState(list: list);
        },
        (r) => GitPageErrorState(),
      );
      print('end=> ${state.value}');
    }
  }

  Future<void> gitPageLoadEvent() async {
    state.value = GitPageLoadingState();
    final resp = await _gitRepository.repositories();
    state.value = resp.fold(
      (l) => GitPageLoadedState(list: l),
      (r) => GitPageErrorState(),
    );
    print('end=> ${state.value}');
  }

  Future<void> gitPageReloadEvent() async {
    state.value = GitPageLoadingState();
    final resp = await _gitRepository.repositories();
    state.value = resp.fold(
      (l) => GitPageLoadedState(list: l),
      (r) => GitPageErrorState(),
    );
    print('end=> ${state.value}');
  }
}
