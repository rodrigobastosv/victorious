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
        height: MediaQuery.of(context).size.width > 768 ? 200 : 100,
        width: MediaQuery.of(context).size.width > 768 ? 550 : 400,
        child: Card(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width > 768 ? 300 : 150,
                height: MediaQuery.of(context).size.width > 768 ? 200 : 100,
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
                  crossAxisAlignment: MediaQuery.of(context).size.width > 768
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateFormatted,
                      textAlign: MediaQuery.of(context).size.width > 768
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 768 ? 20 : 14,
                        fontFamily: 'Heading Pro',
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      titulo,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: MediaQuery.of(context).size.width > 768
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 768 ? 26 : 18,
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
