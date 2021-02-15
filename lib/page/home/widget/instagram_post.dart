import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return InkWell(
      onTap: () => launch(link),
      child: Container(
        width: 300,
        child: Card(
          child: Column(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Text(
                  descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
