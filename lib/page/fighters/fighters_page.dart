import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/fighters.dart';
import '../../model/fighter_model.dart';
import '../shared/vs_scaffold.dart';
import 'widget/category_button.dart';
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
    return VSScaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Buscar Lutador',
                    prefixIcon: FaIcon(FontAwesomeIcons.search)),
                onChanged: _filterFighters,
              ),
            ),
            SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                CategoryButton(),
                CategoryButton(),
                CategoryButton(),
                CategoryButton(),
              ],
            ),
            SizedBox(height: 24),
            fighters.isEmpty
                ? Center(
                    child: Text('Nenhum lutador encontrado!'),
                  )
                : Expanded(
                    child: GridView.builder(
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
                  ),
          ],
        ),
      ),
    );
  }
}
