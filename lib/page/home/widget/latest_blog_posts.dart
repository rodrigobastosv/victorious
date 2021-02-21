import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/vs_loading.dart';
import '../../shared/vs_title.dart';
import 'blog_post.dart';

class LatestBlogPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSTitle('Posts mais recentes em nosso blog'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<QuerySnapshot>(
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
                        postId: blogPost.id,
                        data: blogPost.data()['data'],
                        imagem: blogPost.data()['imagem'],
                        texto: blogPost.data()['texto'],
                        titulo: blogPost.data()['titulo'],
                      ),
                    )
                    .toList();
                return MediaQuery.of(context).size.width > 768
                    ? _PostsDesktop(blogPosts)
                    : _PostsMobile(blogPosts);
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
  final Iterable blogPosts;

  const _PostsDesktop(this.blogPosts);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        ...blogPosts,
      ],
    );
  }
}

class _PostsMobile extends StatelessWidget {
  final Iterable blogPosts;

  const _PostsMobile(this.blogPosts);

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
            ...blogPosts,
          ],
        ),
      ),
    );
  }
}
