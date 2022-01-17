import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:template/data/repositories/git_repository_impl.dart';

import 'git_search_event.dart';
import 'git_search_state.dart';

class GitSearchBloc extends Bloc<GitSearchEvent, GitSearchState> {
  final _gitRepository = Get.find<GitRepositoryImpl>();

  GitSearchBloc() : super(GitInitialState());

  @override
  Stream<GitSearchState> mapEventToState(GitSearchEvent event) async* {
    debugPrint('===> $event    $state');
    if (event is GitLoadMoreEvent) {
      final list = (state as GitLoadedState).list;
      yield GitLoadMoreState(list: list);
      final resp = await _gitRepository.repositories();
      yield resp.fold((l) => GitLoadedState(list: [...list ?? [], ...l]),
          (r) => GitErrorState());
    } else if (event is GitLoadedEvent) {
      yield GitLoadingState();
      final resp = await _gitRepository.repositories();
      yield resp.fold((l) => GitLoadedState(list: l), (r) => GitErrorState());
    } else if (event is GitReloadEvent) {
      yield GitLoadingState();
      final resp = await _gitRepository.repositories();
      yield resp.fold((l) => GitLoadedState(list: l), (r) => GitErrorState());
    }
  }
}
