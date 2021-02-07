import 'package:flutter/material.dart';

import '../shared/vs_scaffold.dart';
import 'widget/footer.dart';
import 'widget/latest_youtube_videos.dart';
import 'widget/news.dart';
import 'widget/banners.dart';
import 'widget/sponsors.dart';
import 'widget/compliments.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Banners(),
            const SizedBox(height: 56),
            News(),
            const SizedBox(height: 80),
            LatestYoutubeVideos(),
            const SizedBox(height: 80),
            Compliments(),
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
