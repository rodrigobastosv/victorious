import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../extension/extensions.dart';
import '../../../locations.dart';

class Post extends StatelessWidget {
  Post({
    this.id,
    this.data,
  });

  final String id;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final date = data['data'].toDate().toString();
    final dateFormatted = date.formatDate();
    return InkWell(
      onTap: () => context.beamTo(
        BlogLocation(
          pathParameters: {
            'postId': id,
          },
          pathBlueprint: 'blog/:postId',
          data: data,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data['imagem']),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateFormatted,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 768 ? 36 : 20,
                      fontFamily: 'Heading Pro',
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data['titulo'],
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 768 ? 30 : 20,
                      fontFamily: 'Heading Pro',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
