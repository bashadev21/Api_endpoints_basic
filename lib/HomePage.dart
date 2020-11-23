import 'package:basicapiApp/DetailsPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> posts;
  Future<List> getendPoints() async {
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    return response.data;
  }

  @override
  void initState() {
    posts = getendPoints();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(posts);
    return Scaffold(
        appBar: AppBar(
          title: Text('ApiApp'),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Container(
            child: FutureBuilder<List>(
                future: posts,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 10.0,
                            child: ListTile(
                              title: Text(snapshot.data[index]['title']),
                              leading:
                                  Text(snapshot.data[index]['id'].toString()),
                              trailing: IconButton(
                                  icon: Icon(Icons.launch),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsPage(
                                                snapshot.data[index]['title'],
                                                snapshot.data[index]['id']
                                                    .toString(),
                                                snapshot.data[index]['body'])));
                                  }),
                            ),
                          );
                        });
                  }
                  return null;
                })));
  }
}
