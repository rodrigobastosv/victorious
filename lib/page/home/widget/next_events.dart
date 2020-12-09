import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data/next_events_data.dart';

class NextEvents extends StatelessWidget {
  const NextEvents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 0.9
        ),
        items: nextEvents
            .map(
              (event) => Image.network(
                event,
                height: 300,
                width: 500,
              ),
            )
            .toList(),
      );
  }
}
