import 'package:clippy_flutter/paralellogram.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;

  const Calendar(this.docs);

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      color: Theme.of(context).colorScheme.secondary.withOpacity(.05),
      child: TableCalendar(
        calendarController: _calendarController,
        locale: 'pt_BR',
        calendarStyle: CalendarStyle(
          markersColor: Theme.of(context).colorScheme.primary,
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonVisible: false,
          headerPadding: EdgeInsets.zero,
          headerMargin: EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryVariant.withOpacity(.2),
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        builders: CalendarBuilders(
          markersBuilder: (context, date, events, holidays) {
            final children = <Widget>[];

            if (events.isNotEmpty) {
              children.add(
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: _buildEventsMarker(date, events),
                ),
              );
            }

            if (holidays.isNotEmpty) {
              children.add(
                Positioned(
                  right: -2,
                  top: -2,
                  child: _buildHolidaysMarker(),
                ),
              );
            }

            return children;
          },
          selectedDayBuilder: (context, date, events) => _buildDay(
            '${date.day}',
            Theme.of(context).colorScheme.primary,
          ),
          todayDayBuilder: (context, date, _) => _buildDay(
            '${date.day}',
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        events: _buildEvents(widget.docs),
        rowHeight: 60,
      ),
    );
  }

  Widget _buildDay(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      child: Container(
        color: color,
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.black
            : _calendarController.isToday(date)
                ? Colors.black
                : Colors.black,
      ),
      width: 16,
      height: 12,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
              color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.red,
    );
  }

  Map<DateTime, List> _buildEvents(List<QueryDocumentSnapshot> docs) {
    final events = <DateTime, List>{};
    for (var doc in docs) {
      final nome = doc.data()['nome'];
      final timestamp = doc.data()['data'] as Timestamp;
      final data = DateTime.parse(timestamp.toDate().toString());
      events.putIfAbsent(data, () => [nome]);
    }
    return events;
  }
}
