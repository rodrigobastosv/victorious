import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'blog_post.dart';
import 'instagram_post.dart';

class LatestInstagramPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('instagram_posts')
          .orderBy('data', descending: true)
          .limit(4)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          final docs = data.docs;
          final instagramPosts = docs.map(
            (doc) => InstagramPost(
              comentario: doc.data()['comentario'],
              descricao: doc.data()['descricao'],
              link: doc.data()['link_postagem'],
              urlFoto: doc.data()['url_foto'],
            ),
          ).toList();
          return Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              ...instagramPosts,
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
