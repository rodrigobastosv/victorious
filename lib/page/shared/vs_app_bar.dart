import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../locations.dart';
import '../home/widget/header_hoverable_button.dart';

class VSAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? _VSAppBarDesktop()
        : _VSAppBarMobile();
  }
}

class _VSAppBarDesktop extends StatelessWidget {
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
          locationKey: 'quem-somos',
          onPressed: () => context.beamTo(
            QuemSomosLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Lutadores',
          locationKey: 'lutadores',
          onPressed: () => context.beamTo(
            FightersLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Calendário',
          locationKey: 'calendario',
          onPressed: () => context.beamTo(
            CalendarLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Vídeos',
          locationKey: 'videos',
          onPressed: () => context.beamTo(
            VideosLocation(),
          ),
        ),
        HeaderHoverableButton(
          text: 'Blog',
          locationKey: 'blog',
          onPressed: () => context.beamTo(
            BlogLocation(pathBlueprint: '/blog'),
          ),
        ),
        HeaderHoverableButton(
          text: 'Contato',
          locationKey: 'contato',
          onPressed: () => context.beamTo(
            ContactLocation(),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _VSAppBarMobile extends StatelessWidget {
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
      titleSpacing: 0,
    );
  }
}
