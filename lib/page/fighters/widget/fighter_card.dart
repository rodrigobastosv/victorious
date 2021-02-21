import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FighterCard extends StatelessWidget {
  const FighterCard(this.fighterDoc, {Key key}) : super(key: key);

  final QueryDocumentSnapshot fighterDoc;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width >= 425
        ? _CardDesktop(fighterDoc)
        : _CardMobile(fighterDoc);
  }
}

class _CardDesktop extends StatelessWidget {
  final QueryDocumentSnapshot fighterDoc;

  const _CardDesktop(this.fighterDoc);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
              fighterDoc.data()['foto'],
              fit: BoxFit.contain,
            ),
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
                  fontFamily: 'Heading Pro',
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

class _CardMobile extends StatelessWidget {
  final QueryDocumentSnapshot fighterDoc;

  const _CardMobile(this.fighterDoc);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              fighterDoc.data()['foto'],
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: MediaQuery.of(context).size.width > 600
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  fighterDoc.data()['nome'],
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Heading Pro',
                  ),
                ),
                SizedBox(height: 16),
                Text(fighterDoc.data()['categoria']),
                SizedBox(height: 2),
                Text(fighterDoc.data()['cartel']),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
