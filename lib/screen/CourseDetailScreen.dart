import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final int courseId;

  CourseDetailScreen({required this.courseId});
  List<Map<String, dynamic>> courseData = [
    {
      'id': 1,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 1',
      'rating': 4.5


    },
    {
      'id': 2,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 2',
      'rating': 4.5


    },
    {
      'id': 3,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 3',
      'rating': 4.5


    },
    {
      'id': 4,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 4',
      'rating': 4.5


    },
    {
      'id': 5,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 5',
      'rating': 4.5


    },
    {
      'id': 6,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 6',
      'rating': 4.5


    },
    {
      'id': 7,
      'thumbnailUrl': 'https://picsum.photos/200/300',
      'title': 'Video Title 7',
      'rating': 4.5
    }
  ];

  @override
  Widget build(BuildContext context) {
    // fetch the course detail using the courseId
    return Scaffold(
      appBar: AppBar(
        title: Text(courseData[courseId -1]['title']),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(courseData[courseId -1]['thumbnailUrl'], fit: BoxFit.fitWidth,),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(' ${courseData[courseId -1]['title']}',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://images.thedirect.com/media/article_full/spider-man-tv-shows.jpg'),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Setha Sensei"),
                    Text('Cybersecurity' , style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),),
                  ],

                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: _buildVideoList(),
          )
        ],
      ),
    );
    // display the course detail

  }
  // widget to list all the videos but not the current video id
  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: courseData.length,
      itemBuilder: (context, index) {
        if (courseData[index]['id'] != courseId) {
          return Container(

            child: ListTile(
              title: CourseCard(
                imageUrl: courseData[index]['thumbnailUrl'],
                title: courseData[index]['title'],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailScreen(courseId: courseData[index]['id'],)));
              },
            ),
          );
        } else {
          return Container(); // return an empty container for the current course id
        }
      },
    );
  }
}

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  CourseCard({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black, // replace with your color
                  ),
                ),
                Container(
                  width: 200,
                  height: 85,
                  margin: EdgeInsets.only(left: 13, top: 5, bottom: 15),
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black, // replace with your color
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
}




