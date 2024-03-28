import 'package:egakko/core/cors.dart';
import 'package:flutter/material.dart';

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
            SearchBar(),
            SizedBox(height: 20.0),
            CategorySlider(),
            SizedBox(height: 20.0),

            // loop for 10 times
            for (int i = 0; i < 10; i++)
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: VideoCard(
                  thumbnailUrl: 'https://picsum.photos/200/300',
                  title: 'Video Title $i',
                  rating: 4.5,
                  profileImageUrl: 'https://picsum.photos/200',
                  channelName: 'Channel Name $i',
                ),
              ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    isNewCourseSelected ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isNewCourseSelected = true;
                  });
                },
                child: Text('New Course'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNewCourseSelected = false;
                  });
                },
                child: Text('Popular Course'),
              ),
            ],
          ),
          isNewCourseSelected
              ? Text('New Course Content')
              : Text('Popular Course Content'),
        ],
      ),
    );
  }
}

// search bar
class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

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
            print('Search term: ${_controller.text}');
          },
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
      height: 50.0,
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
                  fontSize: 16.0,
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
  final String profileImageUrl;
  final String channelName;

  VideoCard({
    required this.thumbnailUrl,
    required this.title,
    required this.rating,
    required this.profileImageUrl,
    required this.channelName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.blue.withOpacity(0.4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Image.network(thumbnailUrl),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(thumbnailUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(title),
          Text('Rating: $rating'),
          Divider(color: Colors.black.withOpacity(0.5)),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              SizedBox(width: 8.0),
              Text(channelName),
            ],
          ),
        ],
      ),
    );
  }
}
