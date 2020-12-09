import 'package:flutter/material.dart';
import 'package:victorious/page/events/events_page.dart';
import 'package:victorious/page/home/widget/next_events.dart';

import '../fighters/fighters_page.dart';
import 'widget/header_hoverable_button.dart';

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
            text: 'Menu',
            onPressed: () {},
          ),
          HeaderHoverableButton(
            text: 'Menu',
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          NextEvents(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text(
          'Footer',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
