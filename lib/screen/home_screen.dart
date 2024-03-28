import 'package:egakko/components/bottom_navigation_bar.dart';
import 'package:egakko/core/cors.dart';
import 'package:egakko/screen/article_screen.dart';
import 'package:egakko/screen/course_screen.dart';

import 'package:egakko/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _children = [
    HomeTab(), // Replace this with your actual home tab widget
    CourseScreen(),
    ArticleScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // This is the drawer icon
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  var coursedata  =  [
    {
      "imagePath": "https://picsum.photos/id/1/200/300",
      "title": "Course 1"
    },
    {
      "imagePath": "https://picsum.photos/id/2/200/300",
      "title": "Course 2"
    },
    {
      "imagePath": "https://picsum.photos/id/3/200/300",
      "title": "Course 3"
    },
    {
      "imagePath": "https://picsum.photos/id/4/200/300",
      "title": "Course 4"
    },
    {
      "imagePath": "https://picsum.photos/id/5/200/300",
      "title": "Course 5"
    },
    {
      "imagePath": "https://picsum.photos/id/6/200/300",
      "title": "Course 6"
    },
    {
      "imagePath": "https://picsum.photos/id/7/200/300",
      "title": "Course 7"
    },
    {
      "imagePath": "https://picsum.photos/id/8/200/300",
      "title": "Course 8"
    },
    {
      "imagePath": "https://picsum.photos/id/9/200/300",
      "title": "Course 9"
    },
    {
      "imagePath": "https://picsum.photos/id/10/200/300",
      "title": "Course 10"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                "Hi, Setha",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins',
                    color: AppColors.appGray3),
                textAlign: TextAlign.left,
              ),
            ),
            _buildBannerSlide(context),
            SizedBox(height: 20),
            Container(
              // add flex of 2 container one text " category " and "see all"
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildEleven(context),
            SizedBox(height: 20),
            // add 10 build card pop course
            Container(
                alignment: Alignment.topLeft,
                child: Text("Popular Courses",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(height: 20),
            for (var i = 0; i < coursedata.length; i++) ...[
              _buildCardPopCourse(context),
              SizedBox(height: 20),
            ]
          ],
        ),
      ),
    ));
  }
}

Widget _buildCardPopCourse(BuildContext context) {
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

Widget _buildEleven(BuildContext context) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // add flex of 2 container
        Container(
          height: 170,
          width: 170,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.book, size: 50, color: Colors.purple),
              SizedBox(width: 10),
              Text("Course", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        Container(
          height: 170,
          width: 170,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.article, size: 50, color: Colors.purple),
              SizedBox(width: 10),
              Text("Articles", style: TextStyle(fontSize: 16)),
            ],
          ),
        )
      ],
    ),
  );
}

// widget banner slide
Widget _buildBannerSlide(BuildContext context) {
  return Container(
    height: 200,
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.purple, // Start color
          Colors.purple.shade100, // End color
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.asset(
            'assets/images/png/banner.png', // Replace with your image URL
            fit: BoxFit.fill,
            width: 150,
            alignment: Alignment.topCenter,
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Growing",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Together ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ],
    ),
  );
}
