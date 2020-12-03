import 'package:flutter/material.dart';

import '../fighters/fighters_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Victorious'),
        actions: [
          FlatButton(
            child: Text('Fighters'),
            textColor: Theme.of(context).appBarTheme.textTheme.button.color,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (buildContext) => FightersPage(),
              ),
            ),
          ),
          FlatButton(
            child: Text('Menu'),
            textColor: Theme.of(context).appBarTheme.textTheme.button.color,
            onPressed: () {},
          ),
          FlatButton(
            child: Text('Menu'),
            textColor: Theme.of(context).appBarTheme.textTheme.button.color,
            onPressed: () {},
          ),
          FlatButton(
            child: Text('Menu'),
            textColor: Theme.of(context).appBarTheme.textTheme.button.color,
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
