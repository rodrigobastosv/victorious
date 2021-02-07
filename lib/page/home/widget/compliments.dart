import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Compliments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('depoimentos')
          .orderBy('data', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          final docs = data.docs;
          final msg = docs.map((d) => d.data()).toList();
          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 200,
              autoPlayInterval: Duration(seconds: 8),
            ),
            items: msg
                .map(
                  (m) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    width: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.quoteLeft,
                          size: 30,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          alignment: Alignment.center,
                          child: Text(
                            m['texto'],
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
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            m['nome_pessoa'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Heading Pro',
                              fontSize: 40,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
