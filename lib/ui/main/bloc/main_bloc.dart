import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_api_bloc_codegen/core/api/product_api.dart';
import 'package:flutter_api_bloc_codegen/core/models/product_model.dart';
import 'package:flutter_api_bloc_codegen/di.dart';
part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ProductApi _api = di.get<ProductApi>();

  MainBloc() : super(const MainState.initial()) {
    on<MainEvent>((event, emit) async {
      await event.map(
        started: (_) async {
          try {
            final List<Product> products = await _api.getProducts();
            emit(MainState.loaded(products));
          } catch (e) {
            emit(MainState.error(e.toString()));
          }
        },
      );
    });
  }
}
