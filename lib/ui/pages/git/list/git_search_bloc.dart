import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '/data/repositories/git_repository_impl.dart';
import 'git_search_event.dart';
import 'git_search_state.dart';

class GitSearchBloc extends Bloc<GitSearchEvent, GitSearchState> {
  final _gitRepository = Get.find<GitRepositoryImpl>();

  GitSearchBloc() : super(GitInitialState()) {
    on<GitLoadMoreEvent>((event, emit) => onNewEvent(event, emit));
    on<GitLoadedEvent>((event, emit) => onNewEvent(event, emit));
    on<GitReloadEvent>((event, emit) => onNewEvent(event, emit));
  }

  Future<void> onNewEvent(
      GitSearchEvent event, Emitter<GitSearchState> emit) async {
    debugPrint('===> $event    $state');

    if (event is GitLoadMoreEvent) {
      final list = (state as GitLoadedState).list;
      emit(GitLoadMoreState(list: list));
      final resp = await _gitRepository.repositories();
      emit(resp.fold((l) => GitLoadedState(list: [...list ?? [], ...l]),
          (r) => GitErrorState()));
    } else if (event is GitLoadedEvent) {
      emit(GitLoadingState());
      final resp = await _gitRepository.repositories();
      emit(resp.fold((l) => GitLoadedState(list: l), (r) => GitErrorState()));
    } else if (event is GitReloadEvent) {
      emit(GitLoadingState());
      final resp = await _gitRepository.repositories();
      emit(resp.fold((l) => GitLoadedState(list: l), (r) => GitErrorState()));
    }
  }
}
