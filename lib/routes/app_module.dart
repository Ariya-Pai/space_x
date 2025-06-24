import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_x/app/data/data_sources/launchpad_source.dart';
import 'package:space_x/app/data/repository/launchpad_repo_impl.dart';
import 'package:space_x/app/domain/repository/launch_repo.dart';
import 'package:space_x/app/domain/use_case/launch_use_case.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';
import 'package:space_x/core/remote/http_client.dart';
import 'package:space_x/core/remote/http_reqest.dart';
import 'package:space_x/localization/language/bloc/set_languange_bloc.dart';
import 'package:space_x/routes/home.dart';

class AppModule extends Module {
  final Dio dio;
  AppModule(this.dio);

  @override
  void binds(i) {
    i.addInstance<Dio>(dio);
    i.addInstance<HttpRequest>(HttpClient(dio));

    i.addSingleton<HomeBloc>(HomeBloc.new);
    i.addSingleton<SetLanguangeBloc>(SetLanguangeBloc.new);

    i.addSingleton<LaunchUseCase>(LaunchUseCase.new);
    i.addSingleton<LaunchRepo>(LaunchpadRepoImpl.new);
    i.addSingleton<LaunchpadSource>(LaunchpadSource.new);
  }

  @override
  void routes(r) {
    r.module(HomeModule.baseRoute, module: HomeModule());
  }
}
