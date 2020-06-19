import 'package:flutter/material.dart';
import 'package:fluttercoursepage/core/models/course.dart';
import 'core/services/course_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CourseApi api = new CourseApi();
  Course course;
  bool busy = false;

  void initCourse() async {
    setState(() {
      busy = true;
    });
    course = await api.getCourse();
    setState(() {
      busy = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: busy
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  course.toString(),
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
      ),
    );
  }
}
