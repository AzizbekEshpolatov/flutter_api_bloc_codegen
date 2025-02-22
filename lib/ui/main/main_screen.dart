import 'package:flutter/material.dart';
import 'package:flutter_api_bloc_codegen/ui/main/widgets/product_appbar.dart';
import 'package:flutter_api_bloc_codegen/ui/main/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_api_bloc_codegen/ui/main/bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.read<MainBloc>().add(const MainEvent.started()),
                child: const Text("Load Products"),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (products) {
              return RefreshIndicator(
                onRefresh: () async =>
                    context.read<MainBloc>().add(const MainEvent.started()),
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      callback: () {
                        // on Tap.
                      },
                    );
                  },
                ),
              );
            },
            error: (message) => Center(
              child: Text(
                "Error: $message",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
