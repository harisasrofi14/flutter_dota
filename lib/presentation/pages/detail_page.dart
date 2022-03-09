import 'package:dota/domain/entities/heroes.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_bloc.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_event.dart';
import 'package:dota/presentation/bloc/recommendation/recommendation_state.dart';
import 'package:dota/presentation/widgets/card_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final Heroes hero;

  const DetailPage({Key? key, required this.hero}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<RecommendationBloc>(context).add(OnGetRecommendation(
          id: widget.hero.id as int,
          primaryAttack: widget.hero.primaryAttr.toString(),
          limit: 3));
    });
  }

  @override
  Widget build(BuildContext context) {
    var img = widget.hero.img;
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hero.localizedName.toUpperCase()),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: orientation == Orientation.portrait
                      ? size.height * 0.3
                      : size.height * 0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://api.opendota.com$img'))),
                  alignment: Alignment.bottomLeft,
                  // This aligns the child of the container
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black12,
                        Colors.black,
                      ],
                    )),
                    child: Padding(
                        padding: const EdgeInsets.all(10.00),
                        //some spacing to the child from bottom
                        child: Text(widget.hero.roles.join(', '),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                  )),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: size.width * 0.95,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          _detailItem(
                              title: "Type",
                              value: widget.hero.attackType ?? "-"),
                          _detailItem(
                              title: "Max Attk",
                              value: widget.hero.baseAttackMax.toString()),
                          _detailItem(
                              title: "Health",
                              value: widget.hero.baseHealth.toString()),
                          _detailItem(
                              title: "MSPD",
                              value: widget.hero.baseMana.toString()),
                          _detailItem(
                              title: "Attr",
                              value: widget.hero.primaryAttr.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<RecommendationBloc, RecommendationState>(
                  builder: (context, state) {
                if (state is RecommendationEmpty) {
                  return const Center(
                    child: Text("Empty"),
                  );
                } else if (state is RecommendationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is RecommendationHasData) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Similar Heroes",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: orientation == Orientation.portrait
                                ? size.height * 0.2
                                : size.height * 0.35,
                            width: size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final hero = state.result[index];
                                return CardRecommendation(heroes: hero);
                              },
                              itemCount: state.result.length,
                            )),
                      ]);
                } else if (state is RecommendationError) {
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
                                BlocProvider.of<RecommendationBloc>(context)
                                    .add(OnGetRecommendation(
                                        id: widget.hero.id as int,
                                        primaryAttack:
                                            widget.hero.primaryAttr.toString(),
                                        limit: 3));
                              },
                              child: const Text("Retry"))
                        ]),
                  );
                } else {
                  return Container();
                }
              }),
            ]),
      )),
    );
  }

  _detailItem({required String title, required String value}) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.white60),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
