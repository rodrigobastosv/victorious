import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/vs_loading.dart';
import 'sponsors_item.dart';

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('patrocinadores').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final docs = snapshot.data.docs;
          final datas = docs.map((d) => d.data()).toList();
          return Center(
            child: Wrap(
              spacing: 8,
              runSpacing: 16,
              children: datas
                  .map((data) => SponsorsItem(data['url'], data['link']))
                  .toList(),
            ),
          );
        } else {
          return VSLoading();
        }
      },
    );
  }
}
