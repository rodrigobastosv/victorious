import 'package:flutter/material.dart';

class InstagramPost extends StatelessWidget {
  InstagramPost({
    this.comentario,
    this.descricao,
    this.link,
    this.urlFoto,
  });

  final String comentario;
  final String descricao;
  final String link;
  final String urlFoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(urlFoto),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                descricao,
                style: TextStyle(
                  fontFamily: 'Heading Pro',
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                comentario,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
