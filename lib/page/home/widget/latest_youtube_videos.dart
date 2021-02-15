import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../shared/vs_loading.dart';
import '../../shared/vs_title.dart';

class LatestYoutubeVideos extends StatefulWidget {
  LatestYoutubeVideos({Key key}) : super(key: key);

  @override
  _LatestYoutubeVideosState createState() => _LatestYoutubeVideosState();
}

class _LatestYoutubeVideosState extends State<LatestYoutubeVideos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSTitle('Vídeos recentes'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('youtube_videos')
                .orderBy('data', descending: true)
                .limit(3)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                final docs = data.docs;
                final lastVideos = docs.map((video) {
                  final idVideo = YoutubePlayerController.convertUrlToId(
                      video.data()['video_url']);
                  return SizedBox(
                    height: 240,
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                        initialVideoId: idVideo,
                        params: YoutubePlayerParams(
                          showFullscreenButton: true,
                        ),
                      ),
                    ),
                  );
                }).toList();
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    ...lastVideos,
                  ],
                );
              } else {
                return VSLoading();
              }
            },
          ),
        ),
      ],
    );
  }
}
