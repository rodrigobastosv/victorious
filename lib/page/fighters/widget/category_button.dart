import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton(this.nome);

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primaryVariant,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          width: 200,
          child: Center(
            child: Text(
              nome,
              style: TextStyle(
                fontFamily: 'Heading Pro',
                fontSize: 22,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
