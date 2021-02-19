import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../shared/vs_loading.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                VSTitle('Vídeos'),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
                      childAspectRatio: 1.5,
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return VSLoading();
          }
        },
      ),
    );
  }
}
