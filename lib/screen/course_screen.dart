import 'dart:convert';

import 'package:egakko/core/cors.dart';
import 'package:egakko/screen/CourseDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CourseScreen extends StatelessWidget {
  static const routeName = '/course';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TabNewNPopularCourse(),

            // loop for 10 times
          ],
        ),
      ),
    );
  }
}

//  create a widget name tabNewNPopularCourse that return a container contain element that can be switch from new course to popular course by clicking the button
class TabNewNPopularCourse extends StatefulWidget {
  @override
  _TabNewNPopularCourseState createState() => _TabNewNPopularCourseState();
}

class _TabNewNPopularCourseState extends State<TabNewNPopularCourse> {
  bool isNewCourseSelected = true;
  String searchValue = '';
  List<Map<String, dynamic>> courseData = [];

  // create list of  course mock data
  Future<List<dynamic>> fetchCourses() async {
    String courses = await rootBundle.loadString("lib/utils/coursedata.json");
    return jsonDecode(courses);
  }

  @override
  void initState() {
    super.initState();
    fetchCourses().then((value) {
      setState(() {
        courseData = List<Map<String, dynamic>>.from(value);
      });
    });
  }

  // List<Map<String, dynamic>> courseData = [
  //   {
  //     'id': 1,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 1',
  //     'rating': 4.5
  //
  //
  //   },
  //   {
  //     'id': 2,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 2',
  //     'rating': 4.5
  //
  //
  //   },
  //   {
  //     'id': 3,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 3',
  //     'rating': 4.5
  //
  //
  //   },
  //   {
  //     'id': 4,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 4',
  //     'rating': 4.5
  //
  //
  //   },
  //   {
  //     'id': 5,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 5',
  //     'rating': 4.5
  //
  //
  //   },
  //   {
  //     'id': 6,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 6',
  //     'rating': 4.5
  //
  //
  //   },
  //   {
  //     'id': 7,
  //     'thumbnailUrl': 'https://picsum.photos/200/300',
  //     'title': 'Video Title 7',
  //     'rating': 4.5
  //   }
  // ];

  List<Map<String, dynamic>> _sortedCourse() {
    // copy the articlesData list to avoid modifying the original list
    var sortedCourses = List<Map<String, dynamic>>.from(courseData);
    // filter the articles that contain the searchTerm in their title or description
    sortedCourses = sortedCourses.where((article) {
      return article['title'].toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
    // sort the filtered list
    sortedCourses.sort((a, b) {
      // compare the titles of the articles
      var comparison = a['id'].compareTo(b['id']);
      // if isNewArticleSelected is true, sort in ascending order
      // otherwise, sort in descending order
      return isNewCourseSelected ? comparison : -comparison;
    });
    return sortedCourses;
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
                      backgroundColor: isNewCourseSelected
                          ? AppColors.primaryColor
                          : Colors.white,
                      // btn radius to 0
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isNewCourseSelected = true;
                      });
                    },
                    child: Text(
                      'New Course',
                      style: TextStyle(
                        color:
                            isNewCourseSelected ? Colors.white : Colors.black,
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
                      backgroundColor: isNewCourseSelected
                          ? Colors.white
                          : AppColors.primaryColor,
                      // btn radius to 0
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isNewCourseSelected = false;
                      });
                    },
                    child: Text(
                      'Popular Course',
                      style: TextStyle(
                        color:
                            isNewCourseSelected ? Colors.black : Colors.white,
                      ),
                    ),
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
          CategorySlider(),
          SizedBox(height: 20.0),
          // loop for 10 times
          ..._sortedCourse().map((course) {
            return Column(
              children: [
                VideoCard(
                  thumbnailUrl: course['thumbnailUrl'],
                  title: course['title'],
                  // rating: course['rating'],
                  videoUrl: course['videoUrl'],
                  id: course['id'], // add this line
                ),
                SizedBox(height: 20.0),
              ],
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
              hintText: 'Search',
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

// slideshow category
class CategorySlider extends StatelessWidget {
  final List<String> categories = [
    'Java',
    'Python',
    'C++',
    "C",
    "PHP",
    "JavaScript",
    "Ruby",
    "Swift",
    "Kotlin",
    "Dart",
    "Go",
    "Rust",
    "Scala",
    "Perl",
    "R",
    "Haskell",
    "Lua",
    "TypeScript",
    "Shell",
    "PowerShell",
    "Objective-C",
    "Assembly",
    "VimL",
    "CoffeeScript",
    "TeX",
    "CSS",
    "Emacs Lisp",
    "Elixir",
    "Clojure",
    "Groovy",
    "Makefile",
    "Vue",
    "Racket",
    "Apex",
    "Arduino",
    "Crystal",
    "Erlang",
    "F#",
    "HCL",
    "HTML",
    "Jupyter Notebook",
    "Kotlin",
    "Nunjucks",
    "OCaml",
    "Pascal",
    "PLpgSQL",
    "PLSQL",
    "Pug",
    "QML",
    "Roff",
    "Ruby",
    "Rust",
    "Scala",
    "Shell",
    "Smarty",
    "SQLPL",
    "Svelte",
    "TSQL",
    "Twig",
    "Vim script",
    "Visual Basic",
    "Vue",
    "WebAssembly",
    "XSLT",
    "Yacc",
    "Zig",
    "ZIL",
    "Zig",
    "ZIL"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// video card
class VideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final double rating;
  final String videoUrl;
  final String profileImageUrl =
      'https://images.thedirect.com/media/article_full/spider-man-tv-shows.jpg';
  final String channelName = 'Setha Sensei';
  final int id;

  VideoCard({
    required this.thumbnailUrl,
    required this.title,
    this.rating = 5.0,
    required this.id,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CourseDetailScreen(courseId: id);
        }));
      },
      child: Container(
        // color: AppColors.blue.withOpacity(0.4),
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
            // Image.network(thumbnailUrl),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                image: DecorationImage(
                  image: NetworkImage(thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    width: 350,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(rating.toString()),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(12.0),
              child: Divider(color: Colors.grey.withOpacity(0.3)),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(channelName),
                      Text(
                        'Cybersecurity',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
