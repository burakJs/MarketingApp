import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_app/core/init/navigation/routes.dart';
import 'package:marketing_app/firebase_options.dart';
import 'package:sizer/sizer.dart';

import 'core/base/bloc/bloc_observer.dart';
import 'core/dependcy_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
      () => runApp(
            MultiBlocProvider(
              providers: [
                ...DependencyInjector.instance.globalBlocProviders,
                ...DependencyInjector.instance.globalCubitProviders,
              ],
              child: MyApp(),
            ),
          ),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      );
    });
  }
}
