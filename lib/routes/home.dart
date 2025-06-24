import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/domain/use_case/launch_use_case.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';
import 'package:space_x/app/modules/home/views/home_page.dart';
import 'package:space_x/app/modules/launch_detail/views/launch_detail_page.dart';

enum HomePageType { home, launchDetails }

extension HomeExtension on HomePageType {
  String toShortString() {
    return toString().split('.').last;
  }

  String get basePath {
    return HomeModule.baseRoute;
  }

  String get route {
    return "/${toShortString()}";
  }

  String get path {
    return "$basePath/${toShortString()}";
  }
}

class HomeModule extends Module {
  static const String baseRoute = '/home';

  @override
  void routes(r) {
    r.child(
      HomePageType.home.route,
      child:
          (context) => BlocProvider<HomeBloc>(
            lazy: false,

            create:
                (context) =>
                    HomeBloc(Modular.get<LaunchUseCase>())
                      ..add(GetAllLaunches()),
            child: HomePage(),
          ),
    );
    r.child(
      HomePageType.launchDetails.route,
      child: (context) {
        LaunchesModel args = Modular.args.data;

        return BlocProvider<HomeBloc>(
          lazy: false,
          create:
              (context) =>
                  HomeBloc(Modular.get<LaunchUseCase>())
                    ..add(GetRocketDetail(id: args.rocket ?? ""))
                    ..add(SaveOneLaunches(data: args))
                    ..add(GetOneCrew(id: args.crew ?? []))
                    ..add(GetOneLaunchPad(id: args.launchpad ?? "")),

          child: LaunchDetailPage(),
        );
      },
    );
  }
}
