import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  final QueryDocumentSnapshot contato;

  const ContactCard(this.contato);

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width > 768 ? 18.0 : 14.0;

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width > 425
          ? 400
          : MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(.05),
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
              fontSize: fontSize,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 4,
            children: [
              Text(
                'Email:',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
              InkWell(
                onTap: () => launch('mailto:${contato['email']}'),
                child: Text(
                  '${contato['email']}',
                  style: TextStyle(
                    fontSize: fontSize,
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
          SizedBox(height: 8),
          _ButtonSocial(
            url: contato['linkedin'],
            icon: FontAwesomeIcons.linkedin,
            text: 'LinkedIn',
          ),
          SizedBox(height: 8),
          _ButtonSocial(
            url: contato['tiktok'],
            icon: FontAwesomeIcons.tiktok,
            text: 'TikTok',
          ),
          SizedBox(height: 8),
          _ButtonSocial(
            url: contato['twitch'],
            icon: FontAwesomeIcons.twitch,
            text: 'Twitch',
          ),
        ],
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
    final fontSize = MediaQuery.of(context).size.width > 768 ? 18.0 : 14.0;
    return InkWell(
      onTap: () async {
        await launch(url);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            alignment: Alignment.center,
            child: FaIcon(
              icon,
              color: Colors.black,
              size: fontSize + 8,
            ),
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
