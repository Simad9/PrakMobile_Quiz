import 'package:flutter/material.dart';
import '../import/import.dart';

class DetailPage extends StatefulWidget {
  final NewsModel model;
  const DetailPage({super.key, required this.model});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(widget.model.image),
            Text(
              widget.model.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(widget.model.description),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  click = true;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: (click) ? Colors.red : Colors.grey,
              ),
              label: Row(
                spacing: 5,
                children: [
                  (click)
                      ? Text((widget.model.likes + 1).toString())
                      : Text(widget.model.likes.toString()),
                  Text("likes")
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
