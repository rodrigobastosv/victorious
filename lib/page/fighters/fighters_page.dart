import 'package:flutter/material.dart';

import '../../data/fighters.dart';
import '../../model/fighter_model.dart';
import 'widget/fighter_card.dart';

class FightersPage extends StatefulWidget {
  FightersPage({Key key}) : super(key: key);

  @override
  _FightersPageState createState() => _FightersPageState();
}

class _FightersPageState extends State<FightersPage> {
  List<FighterModel> fighters;

  @override
  void initState() {
    fighters = allFighters;
    super.initState();
  }

  void _filterFighters(String query) {
    if (query == null || query.isEmpty) {
      setState(() {
        fighters = allFighters;
      });
    } else {
      setState(() {
        fighters = allFighters
            .where((fighter) =>
                fighter.name.toUpperCase().contains(query.toUpperCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Buscar Lutador',
                  ),
                  onChanged: _filterFighters,
                ),
              ),
              fighters.isEmpty ? Center(
                child: Text('Nenhum lutador encontrado!'),
              ) :  GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2,
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (_, i) => FighterCard(fighters[i]),
                itemCount: fighters.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
