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
          final blogPosts = docs.map(
            (blogPost) => BlogPost(),
          ).toList();
          return Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              ...blogPosts,
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
