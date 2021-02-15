import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/vs_loading.dart';

class Banners extends StatelessWidget {
  const Banners({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('banners').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final docs = snapshot.data.docs;
          final urls = docs.map((d) => d.data()['url']).toList();
          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 500,
            ),
            items: urls
                .map(
                  (url) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 24,
                      color: Theme.of(context).colorScheme.onBackground,
                      child: Image.network(
                        url,
                        fit: BoxFit.contain,
                      ),
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
