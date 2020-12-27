import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Wrap(
                spacing: 24,
                children: [
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '© 2020 Victorious. Todos os direitos reservados.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
