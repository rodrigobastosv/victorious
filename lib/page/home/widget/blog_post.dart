import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class BlogPost extends StatelessWidget {
  BlogPost({
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
    final date = DateTime.parse(data.toDate().toString());
    final dia = formatDate(date, [dd]);
    final mes = formatDate(date, [M]);
    final ano = formatDate(date, [yyyy]);
    return Container(
      height: 200,
      width: 500,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagem),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      '$dia de $mes de $ano',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFe2231a),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      titulo,
                      style: TextStyle(
                        fontFamily: 'Heading Pro',
                        fontSize: 18,
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
