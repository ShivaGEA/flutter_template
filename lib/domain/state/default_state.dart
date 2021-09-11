import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_state.freezed.dart';

@freezed
class DefaultState with _$DefaultState {
  const factory DefaultState.initial() = DefaultStateInitial;

  const factory DefaultState.loading() = DefaultStateLoading;

  const factory DefaultState.loaded([@Default(null) dynamic object]) = DefaultStateLoaded;

  const factory DefaultState.error(Exception error) = DefaultStateError;
}
