import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tweets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('twitter_post').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            final doc = data.docs.first;
            return Container(
              width: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    FontAwesomeIcons.quoteLeft,
                    size: 30,
                    color: Theme.of(context).colorScheme.primaryVariant,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      doc.data()['texto'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.quoteRight,
                        size: 30,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      doc.data()['nome_pessoa'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        });
  }
}
