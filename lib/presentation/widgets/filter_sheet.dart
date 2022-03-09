import 'package:dota/domain/entities/filters.dart';
import 'package:dota/presentation/bloc/filter/filter_bloc.dart';
import 'package:dota/presentation/bloc/filter/filter_event.dart';
import 'package:dota/presentation/bloc/filter/filter_state.dart';
import 'package:dota/presentation/bloc/heroes/heroes_bloc.dart';
import 'package:dota/presentation/bloc/heroes/heroes_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  List<String> selected = [];
  List<Filters> _chipsList = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<FilterBloc>(context).add(OnGetFilters());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Filter",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      for (var chip in _chipsList) {
                        chip.isSelected = false;
                      }
                      BlocProvider.of<HeroesBloc>(context)
                          .add(OnGetAllHeroes());
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Reset",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
                if (state is FilterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FilterHasData) {
                  _chipsList = state.result;
                  return Wrap(
                    spacing: 8,
                    direction: Axis.horizontal,
                    children: roleChips(Colors.grey),
                  );
                } else {
                  return const Center(
                    child: Text("Empty"),
                  );
                }
              }),
              ElevatedButton(
                  onPressed: () {
                    for (var c in _chipsList) {
                      if (c.isSelected) {
                        selected.add(c.filterTitle);
                      }
                    }
                    if (selected.isEmpty) {
                      BlocProvider.of<HeroesBloc>(context)
                          .add(OnGetAllHeroes());
                    } else {
                      BlocProvider.of<HeroesBloc>(context)
                          .add(OnFilterHeroes(selected.join('\',\'')));
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text("Filter"))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> roleChips(color) {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: FilterChip(
          selectedColor: Colors.green,
          disabledColor: Colors.grey,
          label: Text(_chipsList[i].filterTitle),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: color,
          selected: _chipsList[i].isSelected,
          showCheckmark: false,
          checkmarkColor: Colors.white,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
