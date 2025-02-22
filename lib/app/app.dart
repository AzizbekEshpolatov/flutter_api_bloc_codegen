import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_api_bloc_codegen/ui/main/main_screen.dart';
import 'package:flutter_api_bloc_codegen/ui/main/bloc/main_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<MainBloc>(create: (context) => MainBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const MainScreen(),
      ),
    );
  }
}
