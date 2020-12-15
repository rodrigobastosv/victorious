import 'package:flutter/material.dart';

import '../events/events_page.dart';
import '../fighters/fighters_page.dart';
import 'widget/header_hoverable_button.dart';
import 'widget/next_events.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'web/images/logo.png',
          height: 40,
        ),
        actions: [
          HeaderHoverableButton(
            text: 'Quem somos',
            onPressed: () {},
          ),
          HeaderHoverableButton(
            text: 'Lutadores',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (buildContext) => FightersPage(),
              ),
            ),
          ),
          HeaderHoverableButton(
            text: 'Eventos',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (buildContext) => EventsPage(),
              ),
            ),
          ),
          HeaderHoverableButton(
            text: 'Calendario',
            onPressed: () {},
          ),
          HeaderHoverableButton(
            text: 'Videos',
            onPressed: () {},
          ),
          HeaderHoverableButton(
            text: 'Blog',
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NextEvents(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Text(
            '© 2020 Victorious. All rights reserved.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
