import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../shared/vs_loading.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';

final categorias = [
  'Todos',
  'Diversos',
  'Entrevistas',
  'Eventos',
];

class VideosPage extends StatefulWidget {
  VideosPage({Key key}) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  int selectedLabelIndex = 0;
  List<QueryDocumentSnapshot> docs;

  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('youtube_videos').snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            docs = data.docs;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                VSTitle('Vídeos'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildVideos(docs),
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

  Widget _buildVideos(List<QueryDocumentSnapshot> docs) {
    return Column(
      children: [
        FlutterToggleTab(
          borderRadius: 0,
          width: MediaQuery.of(context).size.width > 600 ? 80 : 180,
          height: 40,
          initialIndex: selectedLabelIndex,
          selectedTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          unSelectedTextStyle: TextStyle(),
          labels: categorias,
          selectedLabelIndex: (index) {
            setState(() {
              selectedLabelIndex = index;
            });
          },
        ),
        SizedBox(height: 24),
        _getVideos(docs),
      ],
    );
  }

  Widget _getVideos(List<QueryDocumentSnapshot> docs) {
    final categoriaEscolhida = categorias[selectedLabelIndex];
    final docsFiltered = selectedLabelIndex == 0
        ? docs
        : docs
            .where((doc) => doc.data()['categoria'] == categoriaEscolhida)
            .toList();
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (_, i) {
          final idVideo = YoutubePlayerController.convertUrlToId(
              docsFiltered[i].data()['video_url']);
          return YoutubePlayerIFrame(
            controller: YoutubePlayerController(
              initialVideoId: idVideo,
              params: YoutubePlayerParams(
                showFullscreenButton: true,
              ),
            ),
          );
        },
        itemCount: docsFiltered.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: MediaQuery.of(context).size.width > 1024
              ? 3
              : MediaQuery.of(context).size.width >= 768
                  ? 2
                  : 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
      ),
    );
  }
}
