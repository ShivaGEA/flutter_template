import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class GitSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GitReloadEvent extends GitSearchEvent {}

@immutable
class GitLoadedEvent extends GitSearchEvent {}

@immutable
class GitLoadMoreEvent extends GitSearchEvent {}
