import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class GitPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class GitPageReloadEvent extends GitPageEvent {}

@immutable
class GitPageLoadEvent extends GitPageEvent {}

@immutable
class GitPageLoadMoreEvent extends GitPageEvent {}
