import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tweets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('depoimentos')
            .orderBy('data', descending: true)
            .limit(3)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            final docs = data.docs;
            return SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: 600,
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
                          docs[i].data()['texto'],
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
                          docs[i].data()['nome_pessoa'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Heading Pro',
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: docs.length,
              ),
            );
          } else {
            return SizedBox();
          }
        });
  }
}
