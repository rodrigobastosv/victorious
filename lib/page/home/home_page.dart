import 'package:flutter/material.dart';

import '../shared/vs_scaffold.dart';
import 'widget/footer.dart';
import 'widget/news.dart';
import 'widget/next_events.dart';
import 'widget/sponsors.dart';
import 'widget/tweets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            NextEvents(),
            const SizedBox(height: 48),
            News(),
            const SizedBox(height: 48),
            Tweets(),
            const SizedBox(height: 48),
            Sponsors(),
            const SizedBox(height: 24),
            Footer(),
          ],
        ),
      ),
    );
  }
}
