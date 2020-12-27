import 'package:flutter/material.dart';

import 'news_item.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        NewsItem(),
        NewsItem(),
        NewsItem(),
        NewsItem(),
      ],
    );
  }
}
