import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '/domain/datasources/database/entities/git_repo.dart';

@immutable
abstract class GitPageState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GitPageInitialState extends GitPageState {}

@immutable
class GitPageLoadingState extends GitPageInitialState {}

@immutable
class GitPageRepoSearchState extends GitPageState {}

@immutable
class GitPageLoadedState extends GitPageLoadingState {
  final List<GitRepo>? list;

  GitPageLoadedState({@required this.list});

  GitPageLoadedState copyWith({List<GitRepo>? list}) =>
      GitPageLoadedState(list: list ?? this.list);

  @override
  List<Object> get props => [list!];
}

@immutable
class GitPageLoadMoreState extends GitPageLoadedState {
  GitPageLoadMoreState({List<GitRepo>? list}) : super(list: list);
}

@immutable
class GitPageErrorState extends GitPageState {}
