import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/vs_loading.dart';
import '../shared/vs_scaffold.dart';
import '../shared/vs_title.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('contato').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final contato = snapshot.data.docs[0];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VSTitle('Contato'),
                  Wrap(
                    spacing: 32,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(left: 16),
                        width: 400,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.05),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.primaryVariant,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Telefone: ${contato['telefone']}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 4,
                              children: [
                                Text(
                                  'Email:',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      launch('mailto:${contato['email']}'),
                                  child: Text(
                                    '${contato['email']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            _ButtonSocial(
                              url: contato['instagram'],
                              icon: FontAwesomeIcons.instagram,
                              text: 'Instagram',
                            ),
                            SizedBox(height: 8),
                            _ButtonSocial(
                              url: contato['twitter'],
                              icon: FontAwesomeIcons.twitter,
                              text: 'Twitter',
                            ),
                            SizedBox(height: 8),
                            _ButtonSocial(
                              url: contato['facebook'],
                              icon: FontAwesomeIcons.facebook,
                              text: 'Facebook',
                            ),
                            SizedBox(height: 8),
                            _ButtonSocial(
                              url: contato['youtube'],
                              icon: FontAwesomeIcons.youtube,
                              text: 'Youtube',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deixe sua mensagem:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: 300,
                              child: TextField(
                                decoration:
                                    InputDecoration(labelText: 'Seu nome'),
                              ),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(labelText: 'Email'),
                              ),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: 500,
                              child: TextField(
                                minLines: 5,
                                maxLines: 5,
                                decoration:
                                    InputDecoration(labelText: 'Mensagem'),
                              ),
                            ),
                            SizedBox(height: 16),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                              child: Text('Enviar'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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

class _ButtonSocial extends StatelessWidget {
  final String url;
  final IconData icon;
  final String text;

  const _ButtonSocial({this.url, this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch(url);
      },
      child: Row(
        children: [
          Container(
            width: 30,
            alignment: Alignment.center,
            child: FaIcon(
              icon,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
