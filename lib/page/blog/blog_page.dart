import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../shared/vs_loading.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';
import 'widget/post.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSTitle('Blog'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('blog')
                    .orderBy('data', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    final docs = data.docs;

                    return ListView.separated(
                      padding: EdgeInsets.only(bottom: 24),
                      itemCount: docs.length,
                      itemBuilder: (context, i) => Post(
                        data: docs[i].data()['data'],
                        imagem: docs[i].data()['imagem'],
                        texto: docs[i].data()['texto'],
                        titulo: docs[i].data()['titulo'],
                      ),
                      separatorBuilder: (context, index) => Divider(height: 1),
                    );
                  } else {
                    return VSLoading();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
