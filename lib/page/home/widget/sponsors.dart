import 'package:flutter/material.dart';

import 'sponsors_item.dart';

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 16,
      children: [
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
        SponsorsItem(),
      ],
    );
  }
}
