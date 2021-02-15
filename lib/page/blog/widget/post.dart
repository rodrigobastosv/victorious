import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../extension/extensions.dart';
import 'post_detail.dart';

class Post extends StatelessWidget {
  Post({
    this.data,
    this.imagem,
    this.texto,
    this.titulo,
  });

  final Timestamp data;
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
          builder: (buildContext) => PostDetail(
            data: data,
            imagem: imagem,
            texto: texto,
            titulo: titulo,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateFormatted,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Heading Pro',
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Heading Pro',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
