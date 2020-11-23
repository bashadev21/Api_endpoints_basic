import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title, id, body;
  DetailsPage(this.title, this.id, this.body);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DetailsPage'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Card(
          elevation: 20.0,
          child: ListTile(
            title: Text(widget.title),
            leading: Text(widget.id),
            subtitle: Text(widget.body),
          ),
        ));
  }
}
