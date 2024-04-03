import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailScreen extends StatefulWidget {
  final int courseId;

  CourseDetailScreen({required this.courseId});

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List<Map<String, dynamic>> courseData = [];

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

  @override
  Widget build(BuildContext context) {
    // fetch the course detail using the courseId
    return Scaffold(
      appBar: AppBar(
        title: Text(courseData[widget.courseId - 1]['title']),
      ),
      body: Column(
        children: [
          Center(


              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(
                    courseData[widget.courseId - 1]['videoUrl'] ?? '',
                  )!,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),

          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              ' ${courseData[widget.courseId - 1]['title']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.thedirect.com/media/article_full/spider-man-tv-shows.jpg'),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Setha Sensei"),
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
        if (courseData[index]['id'] != widget.courseId) {
          return Container(
            child: ListTile(
              title: CourseCard(
                imageUrl: courseData[index]['thumbnailUrl'],
                title: courseData[index]['title'],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetailScreen(
                              courseId: courseData[index]['id'],
                            )));
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
