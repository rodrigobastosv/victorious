import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: Column(
          children: [
            TableCalendar(
              locale: 'pt_BR',
              calendarController: CalendarController(),
              rowHeight: 60,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('eventos')
                  .orderBy('data')
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  final docs = snapshot.data.docs;
                  return SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemBuilder: (_, i) => ListTile(
                        leading: Text(docs[i].data()['data'].toString()),
                        title: Text(docs[i].data()['nome']),
                        subtitle: Text(docs[i].data()['descricao']),
                      ),
                      itemCount: docs.length,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
