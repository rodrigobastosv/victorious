import 'package:flutter/material.dart';

class BlogPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 200,
              color: Theme.of(context).primaryColor.withAlpha(100),
              alignment: Alignment.center,
              child: Text(
                'Imagem',
                style: TextStyle(
                  fontFamily: 'Heading Pro',
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Lorem ipsum',
                style: TextStyle(
                  fontFamily: 'Heading Pro',
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dui nulla, convallis sit amet velit vitae, lobortis blandit lacus. Sed molestie consequat orci, at mattis nisi volutpat ut. Aliquam eget ante et neque scelerisque varius nec ut ex. Nulla leo magna, egestas vitae mauris eu, scelerisque porta arcu. Phasellus volutpat diam at tellus cursus, at maximus odio blandit. Sed sed tempor nisi. Aliquam imperdiet gravida mi, at tincidunt urna pellentesque sollicitudin.''',
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
