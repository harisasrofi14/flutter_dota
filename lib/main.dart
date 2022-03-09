import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/injection.dart' as di;
import 'package:dota/presentation/bloc/filter/filter_bloc.dart';
import 'package:dota/presentation/bloc/heroes/heroes_bloc.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:dota/presentation/pages/detail_page.dart';
import 'package:dota/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<HeroesBloc>()),
        BlocProvider(create: (_) => di.locator<FilterBloc>()),
        BlocProvider(create: (_) => di.locator<RecommendationBloc>()),
      ],
      child: MaterialApp(
          title: 'Flutter Dota',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            primaryColor: const Color(0xFF000814),
            scaffoldBackgroundColor: const Color(0xFF000814),
          ),
          home: const HomePage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HomePage.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => const HomePage());
              case DetailPage.ROUTE_NAME:
                final hero = settings.arguments as Heroes;
                return MaterialPageRoute(
                  builder: (_) => DetailPage(hero: hero),
                  settings: settings,
                );
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          }),
    );
  }
}
