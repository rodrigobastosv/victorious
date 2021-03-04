import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class PortugueseLocale implements Locale {
  const PortugueseLocale();

  final List<String> monthsShort = const [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez'
  ];

  final List<String> monthsLong = const [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  final List<String> daysShort = const [
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sáb',
    'Dom'
  ];

  final List<String> daysLong = const [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo'
  ];

  @override
  String get am => "AM";

  @override
  String get pm => "PM";
}

class EventsList extends StatelessWidget {
  final List<QueryDocumentSnapshot> docs;

  const EventsList(this.docs);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width >= 1024
            ? MediaQuery.of(context).size.width - 512
            : MediaQuery.of(context).size.width,
        maxHeight: 400,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, i) {
          final timestamp = docs[i].data()['data'] as Timestamp;
          final data = DateTime.parse(timestamp.toDate().toString());
          final dia = formatDate(data, [dd]);
          final mes = formatDate(
            data,
            [M],
            locale: PortugueseLocale(),
          );
          return Padding(
            padding: MediaQuery.of(context).size.width > 768
                ? EdgeInsets.all(16)
                : EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dia,
                      style: TextStyle(fontSize: 50, fontFamily: 'Heading Pro'),
                    ),
                    Text(
                      mes,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Heading Pro',
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width > 768 ? 24 : 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width >= 1024
                            ? MediaQuery.of(context).size.width - 604
                            : MediaQuery.of(context).size.width - 140,
                      ),
                      child: Text(
                        docs[i].data()['nome'],
                        style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width > 768 ? 30 : 20,
                          height: 1,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width >= 1024
                            ? MediaQuery.of(context).size.width - 604
                            : MediaQuery.of(context).size.width - 130,
                      ),
                      child: Text(
                        docs[i].data()['descricao'],
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: docs.length,
      ),
    );
  }
}
