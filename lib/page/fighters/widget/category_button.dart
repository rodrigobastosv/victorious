import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
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
              'CATEGORIA',
              style: TextStyle(
                fontFamily: 'Bebas',
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
