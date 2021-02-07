import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:victorious/page/calendar/widget/calendar.dart';
import 'package:victorious/page/calendar/widget/events_list.dart';
import 'package:victorious/page/shared/vs_title.dart';
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('eventos')
              .orderBy('data')
              .where('data', isGreaterThan: Timestamp.now())
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final docs = snapshot.data.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VSTitle('Calendário'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        Calendar(docs),
                        EventsList(docs),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
