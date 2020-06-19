import 'dart:convert';

import 'package:fluttercoursepage/core/models/course.dart';
import 'package:http/http.dart';

class CourseApi {
  final String url =
      'https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34';

  Future<Course> getCourse() async {
    Response response = await get(url);
    Map courseData = jsonDecode(response.body);
    Course course = Course.fromJson(courseData);
    return course;
  }
}
