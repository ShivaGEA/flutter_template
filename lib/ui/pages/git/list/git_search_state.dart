import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '/domain/datasources/database/entities/git_repo.dart';

@immutable
abstract class GitSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GitInitialState extends GitSearchState {}

@immutable
class GitLoadingState extends GitSearchState {}

@immutable
class GitRepoSearchState extends GitSearchState {}

@immutable
class GitLoadedState extends GitSearchState {
  final List<GitRepo>? list;

  GitLoadedState({@required this.list});

  GitLoadedState copyWith({List<GitRepo>? list}) =>
      GitLoadedState(list: list ?? this.list);

  @override
  List<Object> get props => [list!];
}

@immutable
class GitLoadMoreState extends GitLoadedState {
  GitLoadMoreState({List<GitRepo>? list}) : super(list: list);
}

@immutable
class GitErrorState extends GitSearchState {}
