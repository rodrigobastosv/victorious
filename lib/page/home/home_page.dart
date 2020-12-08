import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../fighters/fighters_page.dart';
import 'header_hoverable_button.dart';

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
            text: 'Menu',
            onPressed: () {},
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
      body: Center(
        child: Text('Home here'),
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
