import 'package:flutter/material.dart';

class HighlightFighterCard extends StatelessWidget {
  const HighlightFighterCard(this.json, {Key key}) : super(key: key);

  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Row(
          children: [
            Image.network(
              json['foto'],
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  json['nome'],
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Bebas',
                  ),
                ),
                SizedBox(height: 16),
                Text(json['categoria']),
                SizedBox(height: 2),
                Text(json['cartel']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
