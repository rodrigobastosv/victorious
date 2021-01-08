import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:victorious/page/shared/vs_scaffold.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideosPage extends StatefulWidget {
  VideosPage({Key key}) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('youtube_videos').snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            final docs = data.docs;
            return GridView.builder(
              itemBuilder: (_, i) {
                final idVideo = YoutubePlayerController.convertUrlToId(
                    docs[i].data()['video_url']);
                return YoutubePlayerIFrame(
                  controller: YoutubePlayerController(
                    initialVideoId: idVideo,
                    params: YoutubePlayerParams(
                      showFullscreenButton: true,
                    ),
                  ),
                );
              },
              itemCount: docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
