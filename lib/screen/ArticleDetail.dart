import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArticleDetailScreen extends StatefulWidget {
  final int articleId;

  ArticleDetailScreen({required this.articleId});

  @override
  _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  List<Map<String, dynamic>> articlesData = [];

  Future<List<dynamic>> fetchArticles() async {
    String articles = await rootBundle.loadString("lib/utils/articledata.json");
    return jsonDecode(articles);
  }

  @override
  void initState() {
    super.initState();
    fetchArticles().then((value) {
      setState(() {
        articlesData = List<Map<String, dynamic>>.from(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // fetch the article detail using the articleId
    return Scaffold(
      appBar: AppBar(
        title: Text(articlesData[widget.articleId -1]['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(articlesData[widget.articleId -1]['thumbnailUrl'], width: double.infinity,),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text(articlesData[widget.articleId -1]['title'],textAlign: TextAlign.start, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text(articlesData[widget.articleId -1]['content'], style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
    // display the article detail
  }
}