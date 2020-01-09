
import 'dart:async';
import 'package:coursesproject/web/course_repo.dart';
import 'package:coursesproject/web/user_repo.dart';

class CourseBloc {

  static CourseBloc _loginBloc = CourseBloc._internal();
  factory CourseBloc() {
    return _loginBloc;
  }

  CourseBloc._internal(){}


}

class CourseStateUpdate {
  String message;
  CourseStateUpdate(this.message);
}
class CreateSuccess extends CourseStateUpdate{
  String token;

  CreateSuccess(this.token, message): super (message);
}
class CreateFailed extends CourseStateUpdate{
  CreateFailed(String message) : super(message);
}

class CreateCourseEvent {
  var title, description, lang, image;
  var show_in_list = true;
  var access = 'public';


  CreateCourseEvent(this.title, this.description, this.lang, this.image);
}
