import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LatestYoutubeVideos extends StatefulWidget {
  LatestYoutubeVideos({Key key}) : super(key: key);

  @override
  _LatestYoutubeVideosState createState() => _LatestYoutubeVideosState();
}

class _LatestYoutubeVideosState extends State<LatestYoutubeVideos> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('youtube_videos')
          .orderBy('data', descending: true)
          .limit(3)
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          final docs = data.docs;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) {
              final idVideo = YoutubePlayerController.convertUrlToId(
                  docs[i].data()['video_url']);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: YoutubePlayerIFrame(
                  controller: YoutubePlayerController(
                    initialVideoId: idVideo,
                    params: YoutubePlayerParams(
                      showFullscreenButton: true,
                    ),
                  ),
                ),
              );
            },
            itemCount: docs.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
