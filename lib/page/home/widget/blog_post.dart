import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../extension/extensions.dart';
import '../../blog/widget/post_detail.dart';

class BlogPost extends StatelessWidget {
  BlogPost({
    this.postId,
    this.data,
    this.imagem,
    this.texto,
    this.titulo,
  });

  final Timestamp data;
  final String postId;
  final String imagem;
  final String texto;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final date = data.toDate().toString();
    final dateFormatted = date.formatDate();
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<Widget>(
          builder: (buildContext) => PostDetail(postId),
        ),
      ),
      child: Container(
        height: 200,
        width: 550,
        child: Card(
          child: Row(
            children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imagem),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateFormatted,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Heading Pro',
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      titulo,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Heading Pro',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
