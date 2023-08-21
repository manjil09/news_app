import 'package:flutter/material.dart';

class NewsViewPage extends StatelessWidget {
  final String title, author, urlToImage, content;

  const NewsViewPage(
      {super.key,
      required this.title,
      required this.author,
      required this.urlToImage,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 195, 207, 224),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              Text(
                author,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                textAlign: TextAlign.justify,
              ),
              Image.network(urlToImage),
              Text(
                content,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
