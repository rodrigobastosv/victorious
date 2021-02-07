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
                    color: Colors.white,
                  ),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                  ),
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '© 2020 Victorious. Todos os direitos reservados.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
