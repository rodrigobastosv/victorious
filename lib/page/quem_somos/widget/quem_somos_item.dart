import 'package:flutter/material.dart';

class QuemSomosItem extends StatelessWidget {
  final String imagem;
  final String descricao;
  final String titulo;
  final String subtitulo;
  final bool isFirst;

  const QuemSomosItem({
    this.imagem,
    this.descricao,
    this.titulo,
    this.subtitulo,
    this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 768;
    return isFirst && isMobile
        ? _FirstItemMobile(
            imagem: imagem,
            descricao: descricao,
            titulo: titulo,
            subtitulo: subtitulo,
          )
        : isFirst && !isMobile
            ? _FirstItem(
                imagem: imagem,
                descricao: descricao,
                titulo: titulo,
                subtitulo: subtitulo,
              )
            : !isFirst && isMobile
                ? _ItemMobile(
                    imagem: imagem,
                    descricao: descricao,
                    titulo: titulo,
                    subtitulo: subtitulo,
                  )
                : _Item(
                    imagem: imagem,
                    descricao: descricao,
                    titulo: titulo,
                    subtitulo: subtitulo,
                  );
  }
}

class _FirstItem extends StatelessWidget {
  final String imagem;
  final String descricao;
  final String titulo;
  final String subtitulo;

  const _FirstItem({
    this.imagem,
    this.descricao,
    this.titulo,
    this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (titulo != null)
                  Text(
                    titulo,
                    style: TextStyle(
                      fontFamily: 'Heading Pro',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (subtitulo != null)
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                SizedBox(height: 16),
                if (descricao != null)
                  Text(
                    descricao,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 700,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 416,
            ),
            child: Image.network(
              imagem,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _FirstItemMobile extends StatelessWidget {
  final String imagem;
  final String descricao;
  final String titulo;
  final String subtitulo;

  const _FirstItemMobile({
    this.imagem,
    this.descricao,
    this.titulo,
    this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.network(
            imagem,
            width: MediaQuery.of(context).size.width - 32,
            fit: BoxFit.contain,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            constraints: BoxConstraints(minWidth: 280),
            padding: EdgeInsets.only(right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (titulo != null)
                  Text(
                    titulo,
                    style: TextStyle(
                      fontFamily: 'Heading Pro',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (subtitulo != null)
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                SizedBox(height: 16),
                if (descricao != null) Text(descricao),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String imagem;
  final String descricao;
  final String titulo;
  final String subtitulo;

  const _Item({
    this.imagem,
    this.descricao,
    this.titulo,
    this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (imagem != null)
          Image.network(
            imagem,
            fit: BoxFit.contain,
            width: 300,
          ),
        Container(
          width: 700,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 364,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (titulo != null)
                Text(
                  titulo,
                  style: TextStyle(
                    fontFamily: 'Heading Pro',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (subtitulo != null)
                Text(
                  subtitulo,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primaryVariant,
                  ),
                ),
              SizedBox(height: 16),
              if (descricao != null)
                Text(
                  descricao,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.3,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}

class _ItemMobile extends StatelessWidget {
  final String imagem;
  final String descricao;
  final String titulo;
  final String subtitulo;

  const _ItemMobile({
    this.imagem,
    this.descricao,
    this.titulo,
    this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (imagem != null)
            Container(
              alignment: Alignment.center,
              width: 300,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 64,
              ),
              child: Image.network(
                imagem,
                fit: BoxFit.contain,
              ),
            ),
          Container(
            width: MediaQuery.of(context).size.width - 316,
            constraints: BoxConstraints(minWidth: 280),
            padding: EdgeInsets.only(right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (titulo != null)
                  Text(
                    titulo,
                    style: TextStyle(
                      fontFamily: 'Heading Pro',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (subtitulo != null)
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                SizedBox(height: 16),
                if (descricao != null) Text(descricao),
              ],
            ),
          )
        ],
      ),
    );
  }
}
