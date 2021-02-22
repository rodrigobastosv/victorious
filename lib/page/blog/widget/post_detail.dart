import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../extension/extensions.dart';
import '../../shared/vs_loading.dart';
import '../../shared/vs_scaffold.dart';

class PostDetail extends StatefulWidget {
  PostDetail(
    this.postId,
  );

  final String postId;

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  Future<DocumentSnapshot> docFuture;

  @override
  void initState() {
    docFuture =
        FirebaseFirestore.instance.collection('blog').doc(widget.postId).get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.width > 600 ? 32.0 : 16.0;
    return VSScaffold(
      body: FutureBuilder(
        future: docFuture,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final docData = snapshot.data;
            final date = docData['data'].toDate().toString();
            final dateFormatted = date.formatDateBig();
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: space),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24),
                          Text(
                            docData['titulo'],
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 768
                                  ? 40
                                  : 30,
                              fontFamily: 'Heading Pro',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            dateFormatted,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Heading Pro',
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                          ),
                          SizedBox(height: 16),
                          Image.network(docData['imagem']),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: space - 8.0),
                      child: Html(data: docData['texto']),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: VSLoading(),
            );
          }
        },
      ),
    );
  }
}
