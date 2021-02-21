import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/vs_loading.dart';

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
              viewportFraction: 1,
              height: 250,
              autoPlayInterval: Duration(seconds: 8),
            ),
            items: msg
                .map(
                  (m) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.of(context).size.width > 600
                        ? 600
                        : MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.quoteLeft,
                          size:
                              MediaQuery.of(context).size.width > 600 ? 30 : 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width > 600
                                ? 30
                                : 10,
                          ),
                          alignment: Alignment.center,
                          height: 140,
                          child: SingleChildScrollView(
                            child: Text(
                              m['texto'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width > 600
                                        ? 24
                                        : 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.quoteRight,
                              size: MediaQuery.of(context).size.width > 600
                                  ? 30
                                  : 20,
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
                              fontSize: MediaQuery.of(context).size.width > 600
                                  ? 40
                                  : 20,
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
          return VSLoading();
        }
      },
    );
  }
}
