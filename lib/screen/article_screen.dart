import 'package:egakko/core/cors.dart';
import 'package:egakko/screen/ArticleDetail.dart';
import 'package:egakko/screen/course_screen.dart';
import 'package:flutter/material.dart';


class ArticleScreen extends StatelessWidget {
  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            TabNewNPopularArticle(),

          ],
        ),
      ),
    );
  }
}

class TabNewNPopularArticle extends StatefulWidget {
  @override
  _TabNewNPopularArticleState createState() => _TabNewNPopularArticleState();
}

class _TabNewNPopularArticleState extends State<TabNewNPopularArticle> {
  bool isNewArticleSelected = true;
  String searchValue = '';
  // create a list of article mock data
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
  List<Map<String, dynamic>> _sortedArticles() {
    // copy the articlesData list to avoid modifying the original list
    var sortedArticles = List<Map<String, dynamic>>.from(articlesData);
    // filter the articles that contain the searchTerm in their title or description
    sortedArticles = sortedArticles.where((article) {
      return article['title'].toLowerCase().contains(searchValue.toLowerCase()) ||
          article['description'].toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
    // sort the filtered list
    sortedArticles.sort((a, b) {
      // compare the titles of the articles
      var comparison = a['id'].compareTo(b['id']);
      // if isNewArticleSelected is true, sort in ascending order
      // otherwise, sort in descending order
      return isNewArticleSelected ? comparison : -comparison;
    });
    return sortedArticles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(

            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appGray4.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(8),
              // border color


              color: Colors.white,
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 208,
                  height: 50,
                  // color: Colors.transparent,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    // borderRadius: BorderRadius.circular( isNewCourseSelected ? 8 : 0),
                    // border color
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isNewArticleSelected
                          ? AppColors.primaryColor
                          : Colors.white,
                      // btn radius to 0
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                    ),
                    onPressed: () {
                      setState(() {
                        isNewArticleSelected = true;
                      });
                    },
                    child: Text('New Article' ,
                      style: TextStyle(
                        color: isNewArticleSelected
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 208,
                  height: 50,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    // borderRadius: BorderRadius.circular( isNewCourseSelected ? 8 : 0),
                    // border color
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isNewArticleSelected
                          ? Colors.white
                          :  AppColors.primaryColor,
                      // btn radius to 0
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 8),
                      ),

                    ),
                    onPressed: () {
                      setState(() {
                        isNewArticleSelected = false;
                      });
                    },
                    child: Text('Popular Article',style: TextStyle(
                      color: isNewArticleSelected
                          ? Colors.black
                          : Colors.white,
                    ),),
                  ),
                ),
              ],
            ),
          ),
          SearchBar(
            onSearch: (value) {
              setState(() {
                searchValue = value;
              });
            },
          ),
          SizedBox(height: 20.0),
          // for (var article in _sortedArticles())
          //   ArticleCard(
          //     title: article['title'],
          //     imageUrl: article['imageUrl'],
          //     description: article['description'],
          //   ),
          ..._sortedArticles().map((article) {
            return ArticleCard(
              title: article['title'],
              imageUrl: article['imageUrl'],
              description: article['description'],
              id: article['id'],
            );
          }).toList(),

        ],
      ),
    );
  }
}

// search bar
class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function(String) onSearch;

  SearchBar({
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search article',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            onSearch(_controller.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.appWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),

            ),
          ),
          child: Text('Search'),
        ),
      ],
    );
  }
}

Widget _buildCardArticle(BuildContext context, String title , String imageUrl, String description) {
  return Align(
    child: Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 120,
                  height: 85,
                  margin: EdgeInsets.only(
                    left: 8,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.appBlack)),
              Container(
                width: 230,
                height: 85,
                margin: EdgeInsets.only(left: 13, top: 5, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// article card
class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final int id;

  ArticleCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(articleId: id),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: _buildCardArticle(context, title, imageUrl, description),
      ),
    );
  }
}


