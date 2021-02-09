import 'package:flutter/material.dart';

import '../shared/vs_scaffold.dart';
import 'widget/banners.dart';
import 'widget/compliments.dart';
import 'widget/footer.dart';
import 'widget/latest_blog_posts.dart';
import 'widget/latest_youtube_videos.dart';
import 'widget/sponsors.dart';

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
            LatestBlogPosts(),
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
