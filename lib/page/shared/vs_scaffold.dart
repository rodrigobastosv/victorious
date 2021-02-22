import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../locations.dart';
import '../home/widget/header_hoverable_button.dart';
import 'vs_app_bar.dart';

class VSScaffold extends StatelessWidget {
  final Widget body;

  const VSScaffold({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? _VSScaffoldDesktop(body: body)
        : _VSScaffoldMobile(body: body);
  }
}

class _VSScaffoldDesktop extends StatelessWidget {
  final Widget body;

  const _VSScaffoldDesktop({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 54),
        child: VSAppBar(),
      ),
      body: body,
    );
  }
}

class _VSScaffoldMobile extends StatelessWidget {
  final Widget body;

  const _VSScaffoldMobile({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 54),
        child: VSAppBar(),
      ),
      body: body,
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: InkWell(
                  child: Image.asset(
                    'web/images/logo.png',
                    height: 36,
                  ),
                  onTap: () => context.beamTo(
                    HomeLocation(),
                  ),
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
