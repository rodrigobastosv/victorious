import 'package:flutter/material.dart';

import 'vs_app_bar.dart';

class VSScaffold extends StatelessWidget {
  final Widget body;

  const VSScaffold({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 54),
        child: VSAppBar(),
      ),
      body: body,
    );
  }
}
