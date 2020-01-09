import 'dart:async';
import 'package:coursesproject/bloc/course_bloc.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  StreamController<CourseStateUpdate> loginStateUpdateStream;

  CourseRepository(this.loginStateUpdateStream);


  Future<void> create(CreateCourseEvent courseEvent) async {
    String url =
        "http://ec2-54-71-69-93.us-west-2.compute.amazonaws.com/lumen-course-v2/courses_lumen/public/v1/course";

    var uri = Uri.parse(url);
    var request = new http.MultipartRequest("POST", uri);

    request.headers['Content-Type'] = 'application/json';
    request.headers["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE4MWE5MDlhYWM3OWEwNDcwZTM2OGNhOGJlNmYwZDkyZTA1ZmExZjE4NjVkODI4YjdkOTMzNmYzNDkxZTVhMmJkNTVjMzY4MDc2YzFhYTM1In0.eyJhdWQiOiIyIiwianRpIjoiMTgxYTkwOWFhYzc5YTA0NzBlMzY4Y2E4YmU2ZjBkOTJlMDVmYTFmMTg2NWQ4MjhiN2Q5MzM2ZjM0OTFlNWEyYmQ1NWMzNjgwNzZjMWFhMzUiLCJpYXQiOjE1Nzg0ODI4OTUsIm5iZiI6MTU3ODQ4Mjg5NSwiZXhwIjoxNjEwMTA1Mjk1LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.Nmm-SPZQVjWwwYMLAdGTDYNia1ev9VJfVDHbuLJbfmA69NeL-ggA6z_SZId_ILQAvb7GfzzO4yyYWeQQalZjKnQAPxBeiVnPYy5UWpdj2qleTVo_jl3VsAZlzNxF-Tt76rb6ahKzS0-h9_Ap4J4A0_KgzEla2wZVIbpYyA-8skCQphh4JXU7no3JuyrDdqxbf5opwqjZ70-_QO-QEf3Ptk3E5UF-pUdg86Z2FaeSYq55NyOVQw69vUfrKM4ASMj8-Kmzxcbvf3faFJQBhze8vO01N0SuceJGOzndUPpuJ0EsbhlFNQU5mgpz-6Jk4F9T_evC--K3SKFdTqDEmDntX6mWKyf112-UzSoL0sBBpqJ2TmmgsBLUzeTQTk1U4cRCtkY3B27Jh8KRL2lkE4l8uf9C-4F-JQwqLxUStY8RbaKR-wXhkbE07KavB9aGGqzj-4PJJnPfUTjJTVlfZWPxtR5EKm5vhziT5DggMtxOQ8HCf4YfWtPZgrRQE87FcvLyfhrxhWm_rQtsmtkHptPN2hMlL_tAZVsNz4bIYANLlaO0qt_wCmWaHkM-MArJ6xQApJqRThzSEcjQgrH6BWhBZ6i4pKneXhf2CvNWNXyYZJGxrLMU-_QgR_Z63vDiFO1a378LRVTUCQHE5s-0nEj_rrSvgWUQN1ZuqyLIaSjvD7Y";
    var dataFields = '{"title": "jan20 2 course sample","description": "desc","lang":"english","image": "http://example1.com/","show_in_list": true,"show_in_list": true,"access": "public"}';

    request.fields["data"] = dataFields.toString();

    /*request.fields["title"] = courseEvent.title;
    request.fields["description"] = courseEvent.description;
    request.fields["c"] = courseEvent.lang;
    request.fields["access"] = courseEvent.access;
    request.fields["show_in_list"] = courseEvent.show_in_list.toString();*/

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image', courseEvent.image); //returns a Future<MultipartFile>
    request.files.add(multipartFile);

    //var response = await request.send();
    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });

  }
}
