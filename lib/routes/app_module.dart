import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';
import 'package:space_x/routes/home.dart';

class AppModule extends Module {
  final Dio dio;
  AppModule(this.dio);
  @override
  void binds(i) {
    i.addInstance<Dio>(dio);
    i.addInstance<HttpClient>(HttpClient());
    i.addSingleton<HomeBloc>(HomeBloc.new);
  }

  @override
  void routes(r) {
    r.module(HomeModule.baseRoute, module: HomeModule());
  }
}
