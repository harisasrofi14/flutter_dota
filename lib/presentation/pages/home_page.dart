import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/presentation/bloc/heroes/heroes_bloc.dart';
import 'package:dota/presentation/bloc/heroes/heroes_event.dart';
import 'package:dota/presentation/bloc/heroes/heroes_state.dart';
import 'package:dota/presentation/widgets/card_hero.dart';
import 'package:dota/presentation/widgets/filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Heroes> records = [];

  int idx = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<HeroesBloc>(context).add(OnGetAllHeroes());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "DOTA",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        )),
      ),
      body: SafeArea(
        child: BlocBuilder<HeroesBloc, HeroesState>(builder: (context, state) {
          if (state is HeroesEmpty) {
            return const Center(
              child: Text("Empty"),
            );
          }
          if (state is HeroesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HeroesHasData) {
            records = state.result;

            return GridView.count(
                childAspectRatio: orientation == Orientation.portrait
                    ? ((size.width / 2) / (size.height * 0.3))
                    : ((size.width / 3) / (size.height * 0.75)),
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(records.length, (index) {
                  return CardHero(records[index]);
                }));
          } else if (state is HeroesError) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(state.message),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HeroesBloc>(context)
                            .add(OnGetAllHeroes());
                      },
                      child: const Text("Retry"))
                ]));
          } else {
            return Container();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: const Icon(Icons.filter_list_outlined),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return const FilterSheet();
        });
  }
}
