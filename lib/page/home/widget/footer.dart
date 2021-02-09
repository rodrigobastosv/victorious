import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  GestureDetector(
                    onTap: () async {
                      await launch(
                          'https://www.instagram.com/victoriousmmabr/');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch('https://twitter.com/victoriousmmabr');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch('https://www.facebook.com/victoriousmmabr');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch(
                          'https://www.youtube.com/channel/UCS2agJjBKC2JuPbTh-7NDoQ');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.youtube,
                      color: Colors.white,
                    ),
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
