import 'package:clippy_flutter/paralellogram.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorsItem extends StatelessWidget {
  SponsorsItem(this.url, this.link);

  final String url;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Parallelogram(
      cutLength: 20,
      child: InkWell(
        onTap: () => link != null ? launch(link) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 100,
          width: 200,
          child: Image.network(url),
        ),
      ),
    );
  }
}
