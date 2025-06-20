import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_x/app/modules/home/bloc/home_bloc.dart';
import 'package:space_x/app/modules/home/views/home_page.dart';

enum HomePageType { home, details }

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
          (context) =>
              BlocProvider(create: (context) => HomeBloc(), child: HomePage()),
    );
  }
}
