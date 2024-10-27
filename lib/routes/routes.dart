import 'package:nadezda/export.dart';
import 'package:nadezda/pages/analyses_lesson.dart';

final routes = {
  '/' : (context) => const FirstPage(),
  '/teachers_list' : (context) => const TeachersListPage(),
  '/teachers_list_for_guest' : (context) => const TeachersListForGuest(),
  '/teacher_page' : (context) => const TeacherPage(),
  '/teacher_page_admin' : (context) => const TeacherPageAdmin(),
  '/details_teacher' : (context) => const DetailsTeacherPage(),
  '/lesson_details' : (context) => const LessonDetailsPage(),
  '/analyses_lesson' : (cntext) => const AnalysesLesson(),
};
