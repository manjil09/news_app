import 'package:flutter/material.dart';
import 'package:news_app/news/new_service.dart';
import 'package:news_app/news/news_model.dart';

class NewsInterface extends StatefulWidget {
  const NewsInterface({super.key});

  @override
  State<NewsInterface> createState() => _NewsInterfaceState();
}

class _NewsInterfaceState extends State<NewsInterface> {
  Future<dynamic>? newsResponse;

  @override
  void initState() {
    newsResponse = NewsService.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: newsResponse,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data.status),
                ],
              );
            }
            return const Center(
              child: Text("No data found!"),
            );
          },
        ),
      ),
    );
  }
}
