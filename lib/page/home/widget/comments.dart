import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Comments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            FontAwesomeIcons.quoteLeft,
            size: 30,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dui nulla, convallis sit amet velit vitae, lobortis blandit lacus.''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FaIcon(
                FontAwesomeIcons.quoteRight,
                size: 30,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            ],
          ),
          Center(
            child: Text(
              'Anderson Silva',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Bebas',
                fontSize: 30,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
