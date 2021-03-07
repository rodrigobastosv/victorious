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
        width: 283,
        child: Card(
          child: Column(
            children: [
              Container(
                width: 283,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryVariant,
                  image: DecorationImage(
                    image: NetworkImage(urlFoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 283,
                height: 220,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Text(
                  (descricao.length > 350
                      ? '${descricao.substring(0, 350)}...'
                      : descricao),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
