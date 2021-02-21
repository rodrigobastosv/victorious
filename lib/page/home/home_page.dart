import 'package:flutter/material.dart';

import '../shared/vs_scaffold.dart';
import 'widget/banners.dart';
import 'widget/compliments.dart';
import 'widget/footer.dart';
import 'widget/latest_blog_posts.dart';
import 'widget/latest_instagram_posts.dart';
import 'widget/latest_youtube_videos.dart';
import 'widget/sponsors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.width > 600 ? 80.0 : 40.0;
    return VSScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Banners(),
            SizedBox(height: 32),
            LatestBlogPosts(),
            SizedBox(height: space),
            LatestInstagramPosts(),
            SizedBox(height: space),
            LatestYoutubeVideos(),
            SizedBox(height: space),
            Compliments(),
            SizedBox(height: space-24.0),
            Sponsors(),
            SizedBox(height: 24),
            Footer(),
          ],
        ),
      ),
    );
  }
}
