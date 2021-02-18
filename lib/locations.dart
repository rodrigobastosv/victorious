import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'page/blog/blog_page.dart';
import 'page/blog/widget/post_detail.dart';
import 'page/calendar/calendar_page.dart';
import 'page/contact/contact_page.dart';
import 'page/fighters/fighters_page.dart';
import 'page/home/home_page.dart';
import 'page/quem_somos/quem_somos_page.dart';
import 'page/videos/videos_page.dart';

class HomeLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/'];

  @override
  List<BeamPage> get pages => [
        BeamPage(
          key: ValueKey('home'),
          child: HomePage(),
        ),
      ];
}

class QuemSomosLocation extends BeamLocation {
  QuemSomosLocation()
      : super(
          pathBlueprint: '/quem-somos',
        );

  @override
  List<String> get pathBlueprints => ['/quem-somos'];

  @override
  List<BeamPage> get pages => [
        BeamPage(
          key: ValueKey('quem-somos'),
          child: QuemSomosPage(),
        ),
      ];
}

class FightersLocation extends BeamLocation {
  FightersLocation()
      : super(
          pathBlueprint: '/lutadores',
        );

  @override
  List<String> get pathBlueprints => ['/lutadores'];

  @override
  List<BeamPage> get pages => [
        BeamPage(
          key: ValueKey('lutadores'),
          child: FightersPage(),
        ),
      ];
}

class CalendarLocation extends BeamLocation {
  CalendarLocation()
      : super(
          pathBlueprint: '/calendario',
        );

  @override
  List<String> get pathBlueprints => ['/calendario'];

  @override
  List<BeamPage> get pages => [
        BeamPage(
          key: ValueKey('calendario'),
          child: CalendarPage(),
        ),
      ];
}

class VideosLocation extends BeamLocation {
  VideosLocation()
      : super(
          pathBlueprint: '/videos',
        );

  @override
  List<String> get pathBlueprints => ['/videos'];

  @override
  List<BeamPage> get pages => [
        BeamPage(
          key: ValueKey('videos'),
          child: VideosPage(),
        ),
      ];
}

class BlogLocation extends BeamLocation {
  BlogLocation({
    String pathBlueprint,
    Map<String, String> pathParameters,
    Map<String, dynamic> data,
  }) : super(
          pathBlueprint: pathBlueprint,
          pathParameters: pathParameters,
          data: data,
        );

  @override
  List<String> get pathBlueprints => ['/blog/:postId'];

  @override
  List<BeamPage> get pages => [
        ...HomeLocation().pages,
        if (pathSegments.contains('blog'))
          BeamPage(
            key: ValueKey('blog'),
            child: BlogPage(),
          ),
        if (pathParameters.containsKey('postId'))
          BeamPage(
            key: ValueKey('blog/}'),
            child: PostDetail(pathParameters['postId']),
          ),
      ];
}

class ContactLocation extends BeamLocation {
  ContactLocation()
      : super(
          pathBlueprint: '/contato',
        );

  @override
  List<String> get pathBlueprints => ['/contato'];

  @override
  List<BeamPage> get pages => [
        BeamPage(
          key: ValueKey('contato'),
          child: ContactPage(),
        ),
      ];
}
