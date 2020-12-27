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
        enlargeCenterPage: true,
        height: 500,
      ),
      items: nextEvents
          .map(
            (event) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 24,
                color: Theme.of(context).primaryColor,
                child: Image.network(
                  event,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
