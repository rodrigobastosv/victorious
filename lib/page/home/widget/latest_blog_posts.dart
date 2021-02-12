import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'blog_post.dart';

class LatestBlogPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('blog')
          .orderBy('data', descending: true)
          .limit(4)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          final docs = data.docs;
          final blogPosts = docs
              .map(
                (blogPost) => BlogPost(
                  data: blogPost.data()['data'],
                  imagem: blogPost.data()['imagem'],
                  texto: blogPost.data()['texto'],
                  titulo: blogPost.data()['titulo'],
                ),
              )
              .toList();
          return Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              ...blogPosts,
            ],
          );
          /*return Center(
            child: Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: blogPosts[i],
                ),
                itemCount: blogPosts.length,
              ),
            ),
          );*/
        } else {
          return SizedBox();
        }
      },
    );
  }
}
