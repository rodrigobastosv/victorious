import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../shared/vs_scaffold.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return VSScaffold(
      body: SafeArea(
        child: TableCalendar(
          locale: 'pt_BR',
          calendarController: CalendarController(),
          rowHeight: 60,
        ),
      ),
    );
  }
}
