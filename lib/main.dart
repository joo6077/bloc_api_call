import 'package:comento_task/application/app.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/domain/dataSources/client.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:comento_task/presentation/detail/bloc/detail_bloc.dart';
import 'package:comento_task/presentation/list/bloc/category/category_bloc.dart';
import 'package:comento_task/presentation/list/bloc/list/list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio(BaseOptions(headers: {'Accept': 'application/json'}));
  final client = Client(dio);

  runApp(
    RepositoryProvider(
      create: (context) => ListRepository(client),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ListBloc(context.read<ListRepository>())),
          BlocProvider(
              create: (context) => DetailBloc(context.read<ListRepository>())),
          BlocProvider(
              create: (context) =>
                  CategoryBloc(context.read<ListRepository>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            extensions: <ThemeExtension<dynamic>>[
              CustomColors.light,
            ],
            textTheme: JTextTheme.light,
          ),
          darkTheme: ThemeData.dark().copyWith(
            extensions: <ThemeExtension<dynamic>>[
              CustomColors.dark,
            ],
          ),
          home: const App(),
        ),
      ),
    ),
  );
}
