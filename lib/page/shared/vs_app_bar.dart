import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../locations.dart';
import '../home/widget/header_hoverable_button.dart';

class VSAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: InkWell(
        child: Image.asset(
          'web/images/logo.png',
          height: 36,
        ),
        onTap: () => context.beamTo(
          HomeLocation(),
        ),
      ),
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      actions: [
        HeaderHoverableButton(
          text: 'Quem somos',
          onPressed: () => context.beamTo(
            QuemSomosLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Lutadores',
          onPressed: () => context.beamTo(
            FightersLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Calendário',
          onPressed: () => context.beamTo(
            CalendarLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Vídeos',
          onPressed: () => context.beamTo(
            VideosLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Blog',
          onPressed: () => context.beamTo(
            BlogLocation(pathBlueprint: '/blog'),
          ),
        ),
        HeaderHoverableButton(
          text: 'Contato',
          onPressed: () => context.beamTo(
            ContactLocation(),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
