import 'package:flutter/material.dart';
import 'package:victorious/model/fighter_model.dart';

class FighterCard extends StatelessWidget {
  const FighterCard(this.fighter, {Key key}) : super(key: key);

  final FighterModel fighter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network(
            fighter.urlImage,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fighter.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
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
