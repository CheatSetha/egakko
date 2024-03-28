import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final int articleId;
  final List<Map<String, dynamic>> articlesData = [
    {
      'id': 1,
      'title': 'Article 1',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 1',
    },
    {
      'id': 2,
      'title': 'Article 2',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 2',
    },
    {
      'id': 3,
      'title': 'Article 3',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 3',
    },
    {
      'id': 4,
      'title': 'Article 4',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 4',
    },
    {
      'id': 5,
      'title': 'Article 5',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 5',
    },
    {
      'id': 6,
      'title': 'Article 6',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 6',
    },
    {
      'id': 7,
      'title': 'Article 7',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 7',
    },
    {
      'id': 8,
      'title': 'Article 8',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 8',
    },
    {
      'id': 9,
      'title': 'Article 9',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 9',
    },
    {
      'id': 10,
      'title': 'Article 10',
      'imageUrl': 'assets/images/png/software-engineer.png',
      'description': 'This is a description of article 10',
    },
  ];

  ArticleDetailScreen({required this.articleId});

  @override
  Widget build(BuildContext context) {
    // fetch the article detail using the articleId
    return Scaffold(
      appBar: AppBar(
        title: Text(articlesData[articleId -1]['title']),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(articlesData[articleId -1]['imageUrl'], width: double.infinity,),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text(articlesData[articleId -1]['title'],textAlign: TextAlign.start, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20),
              child: Text(articlesData[articleId -1]['description'], style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
    // display the article detail
  }
}