import 'package:comento_task/application/app.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/domain/api/client.dart';
import 'package:comento_task/domain/dataSources/comento_remote_data_source.dart';
import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:comento_task/presentation/list/bloc/list/list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json'}));
  final comentoRemoteDataSource = ComentoRemoteDataSource(client: Client(dio));

  runApp(MaterialApp(
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
    home: MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => ListRepository(comentoRemoteDataSource))
      ],
      child: BlocProvider(
        create: (context) => ListBloc(context.read<ListRepository>()),
        child: App(),
      ),
    ),
  ));
}
