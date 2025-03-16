import 'package:flutter/material.dart';
import '../import/import.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage(username: widget.username),
                  ),
                );
              },
              icon: Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contest) => LoginPage(),
                  ),
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 15,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    NewsModel.dummyNews.length,
                    (i) => _itemCard(
                        context: context,
                        model: NewsModel.dummyNews[i],
                        clicked: clicked),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemCard(
      {required BuildContext context,
      required NewsModel model,
      required clicked}) {
    return Column(
      spacing: 10,
      children: [
        Image.network(model.image),
        Text(
          model.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          spacing: 5,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            Row(
              spacing: 5,
              children: [Text(model.likes.toString()), Text("likes")],
            )
          ],
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(model: model)));
            },
            child: Text("Detail")),
        SizedBox(height: 10),
      ],
    );
  }
}
