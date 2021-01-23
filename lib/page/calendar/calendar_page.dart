import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
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
                children: [
                  TableCalendar(
                    locale: 'pt_BR',
                    events: _buildEvents(docs),
                    calendarController: CalendarController(),
                    rowHeight: 60,
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemBuilder: (_, i) {
                        final timestamp = docs[i].data()['data'] as Timestamp;
                        final data =
                            DateTime.parse(timestamp.toDate().toString());
                        final dataFormatada =
                            formatDate(data, [dd, '/', mm, '/', yyyy]);
                        return ListTile(
                          leading: Text(dataFormatada.toString()),
                          title: Text(docs[i].data()['nome']),
                          subtitle: Text(docs[i].data()['descricao']),
                        );
                      },
                      itemCount: docs.length,
                    ),
                  )
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
