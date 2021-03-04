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
    this.isFirst
  });

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      spacing: 16,
      overflowSpacing: 16,
      children: [
        if (imagem != null)
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: isFirst ? 700 : 300),
            child: Image.network(imagem),
          ),
        Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - (isFirst ? 900 : 500),
            minWidth: 300,
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
        ),
      ],
    );
  }
}
