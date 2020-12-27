import 'package:clippy_flutter/paralellogram.dart';
import 'package:flutter/material.dart';

class SponsorsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Parallelogram(
      cutLength: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 100,
        width: 200,
        color: Theme.of(context).colorScheme.secondary,
        child: Center(
          child: Text(
            'Patrocinador',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
