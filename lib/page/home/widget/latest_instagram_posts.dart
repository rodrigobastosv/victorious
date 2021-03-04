import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/vs_loading.dart';
import '../../shared/vs_title.dart';
import 'instagram_post.dart';

class LatestInstagramPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSTitle('Destaques no Instagram'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('instagram_posts')
                .orderBy('data', descending: true)
                .limit(4)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                final docs = data.docs;
                final instagramPosts = docs
                    .map(
                      (doc) => InstagramPost(
                        comentario: doc.data()['comentario'],
                        descricao: doc.data()['descricao'],
                        link: doc.data()['link_postagem'],
                        urlFoto: doc.data()['url_foto'],
                      ),
                    )
                    .toList();
                return MediaQuery.of(context).size.width > 768
                    ? _PostsDesktop(instagramPosts)
                    : _PostsMobile(instagramPosts);
              } else {
                return VSLoading();
              }
            },
          ),
        ),
      ],
    );
  }
}

class _PostsDesktop extends StatelessWidget {
  final Iterable instagramPosts;

  const _PostsDesktop(this.instagramPosts);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        ...instagramPosts,
      ],
    );
  }
}

class _PostsMobile extends StatelessWidget {
  final Iterable instagramPosts;

  const _PostsMobile(this.instagramPosts);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            ...instagramPosts,
          ],
        ),
      ),
    );
  }
}
