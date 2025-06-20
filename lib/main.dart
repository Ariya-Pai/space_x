// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:space_x/localization/app_localization.dart';
import 'package:space_x/routes/app_module.dart';
import 'package:space_x/routes/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/src/global_loader_overlay.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.setInitialRoute(HomePageType.home.path);
  final apiClient = createApiClient('https://api.spacexdata.com/v4/');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: AppModule(apiClient), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.5),
      overlayWidgetBuilder:
          (_) => Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.black,
              size: 30,
            ),
          ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(),
        child: MaterialApp.router(
          title: 'SpaceX Flutter App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),

          debugShowCheckedModeBanner: false,
          routerConfig: Modular.routerConfig,
          locale: Locale('th'),
          localizationsDelegates: const [
            // Add your localization delegates here
            AppLocalizations.delegate,

            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}

Dio createApiClient(String baseURL) {
  final dio =
      Dio()
        ..options.baseUrl = baseURL
        ..options.connectTimeout = const Duration(milliseconds: 6000)
        ..options.receiveTimeout = const Duration(milliseconds: 6000);
  return dio;
}
