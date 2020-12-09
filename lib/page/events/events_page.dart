import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../data/next_events_data.dart';
import 'widgets/next_event_card.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: nextEvents.length,
          itemBuilder: (_, i) {
            return AnimationConfiguration.staggeredList(
              position: i,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 120,
                child: FadeInAnimation(
                  child: NextEventCard(nextEvents[i]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
