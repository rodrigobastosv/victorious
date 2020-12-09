import 'package:flutter/material.dart';

class NextEventCard extends StatelessWidget {
  const NextEventCard(this.url, {Key key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
        width: 60,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                ),
              ),
              Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
            ],
          ),
        ),
      ),
    );
  }
}
