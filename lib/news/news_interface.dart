import 'package:flutter/material.dart';
import 'package:news_app/news/new_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/news/news_view_page.dart';

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
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: newsResponse,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final articles = snapshot.data.articles;
              return CarouselSlider.builder(
                itemCount: articles.length,
                itemBuilder: (context, index, realIndex) {
                  final article = articles[index];
                   return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0), // Increase the vertical padding
                    child: NewsViewPage(
                    title: article?.title ?? 'No title available',
                    author: article?.author ?? 'No author available',
                    urlToImage: article?.urlToImage ?? 'https://via.placeholder.com/150',
                    content: article?.content ?? 'No content available',
                  ));
                },
                options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    height: height,
                    enableInfiniteScroll: false),
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