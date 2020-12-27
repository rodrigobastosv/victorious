import 'package:flutter/material.dart';

import '../../../model/fighter_model.dart';

class FighterCard extends StatelessWidget {
  const FighterCard(this.fighter, {Key key}) : super(key: key);

  final FighterModel fighter;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            fighter.urlImage,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fighter.name,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Bebas',
                ),
              ),
              SizedBox(height: 16),
              Text(fighter.category),
              SizedBox(height: 2),
              Text('${fighter.wins}-${fighter.losses}-${fighter.draws}'),
            ],
          ),
        ],
      ),
    );
  }
}
