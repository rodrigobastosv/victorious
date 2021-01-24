import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/fighter_model.dart';

class FighterCard extends StatelessWidget {
  const FighterCard(this.fighterDoc, {Key key}) : super(key: key);

  final QueryDocumentSnapshot fighterDoc;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            fighterDoc.data()['foto'],
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fighterDoc.data()['nome'],
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Bebas',
                ),
              ),
              SizedBox(height: 16),
              Text(fighterDoc.data()['categoria']),
              SizedBox(height: 2),
              Text(fighterDoc.data()['cartel']),
            ],
          ),
        ],
      ),
    );
  }
}
