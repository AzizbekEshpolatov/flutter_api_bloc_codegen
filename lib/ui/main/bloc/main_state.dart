part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.loading() = _Loading;
  const factory MainState.loaded(List<Product> products) = _Loaded;
  const factory MainState.error(String message) = _Error;
}
