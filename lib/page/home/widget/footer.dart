import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/vs_loading.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('contato').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contato = snapshot.data.docs[0];
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Wrap(
                      spacing: 24,
                      children: [
                        InkWell(
                          onTap: () async {
                            await launch(contato['instagram']);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launch(contato['twitter']);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launch(contato['facebook']);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await launch(contato['youtube']);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.youtube,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '© 2020 Victorious. Todos os direitos reservados.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return VSLoading();
          }
        },
      ),
    );
  }
}
