import 'package:egakko/core/cors.dart';
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
            TabNewNPopularCourse(),
            SearchBar(),
            SizedBox(height: 20.0),
          
           
          
            // loop for 10 times
            for (int i = 0; i < 10; i++)
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child:  _ArticleCard(context),
              ),
          ],
        ),
      ),
    );
  }
}
class _TabNewNPopularCourseState extends State<TabNewNPopularCourse> {
  bool isNewCourseSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.white,
      child: Column(

        children: [
          Container(
          width: double.infinity,
        height: 50,

      ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              ElevatedButton(

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

Widget _ArticleCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => DetailScreen()),
      // );
    },
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
                            'assets/images/png/software-engineer.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.appBlack)),
              Container(
                width: 250,
                height: 85,
                margin: EdgeInsets.only(left: 13, top: 5, bottom: 15),
                child: Text(
                  "Improve Your English Skills Specialization",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBlack,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
