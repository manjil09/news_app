import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/news/news_model.dart';

class NewsService {
  static Future<dynamic> getNews() async {
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?apiKey=4a166e65a8854a5996b5f7893bc1d627&country=us&category=business"));
    if (response.statusCode == 200) {
      return NewsModel.fromJson(json.decode(response.body));
    }
  }
}
