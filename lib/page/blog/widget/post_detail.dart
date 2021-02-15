import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../extension/extensions.dart';
import '../../shared/vs_scaffold.dart';

class PostDetail extends StatelessWidget {
  PostDetail({
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
    final dateFormatted = date.formatDateBig();
    return VSScaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Heading Pro',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  dateFormatted,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Heading Pro',
                    color: Theme.of(context).colorScheme.primaryVariant,
                  ),
                ),
                SizedBox(height: 16),
                Image.network(imagem),
                SizedBox(height: 16),
                Html(data: texto),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
