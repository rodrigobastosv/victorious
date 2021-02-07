import 'package:flutter/material.dart';

import '../shared/vs_scaffold.dart';
import 'widget/footer.dart';
import 'widget/latest_youtube_videos.dart';
import 'widget/news.dart';
import 'widget/banners.dart';
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
            Banners(),
            const SizedBox(height: 48),
            News(),
            const SizedBox(height: 48),
            SizedBox(
              height: 300,
              child: LatestYoutubeVideos(),
            ),
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
