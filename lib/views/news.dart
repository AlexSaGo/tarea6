import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsItems = [];

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('https://blog.ted.com/wp-json/wp/v2/posts?_embed&per_page=3'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<NewsItem> items = [];
      for (var data in jsonData) {
        final String title = _removeHtmlTags(data['title']['rendered']);
        final String excerpt = _removeHtmlTags(data['excerpt']['rendered']);
        final String url = data['link'];

        items.add(NewsItem(title: title, excerpt: excerpt, url: url));
      }

      setState(() {
        newsItems = items;
      });
    } else {
      throw Exception('Failed to fetch news data');
    }
  }

  String _removeHtmlTags(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final item = newsItems[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.excerpt),
            onTap: () {
              // Abrir el enlace de la noticia original
              // Puedes usar el paquete `url_launcher` para abrir el enlace en el navegador
            },
          );
        },
      ),
    );
  }
}

class NewsItem {
  final String title;
  final String excerpt;
  final String url;

  NewsItem({
    required this.title,
    required this.excerpt,
    required this.url,
  });
}
