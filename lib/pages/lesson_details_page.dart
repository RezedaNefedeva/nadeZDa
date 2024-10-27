
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';

class LessonDetailsPage extends StatefulWidget {
  static String date = '';
  const LessonDetailsPage({super.key});

  @override
  State<LessonDetailsPage> createState() => _LessonDetailsPageState();
}

class _LessonDetailsPageState extends State<LessonDetailsPage> {

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  String group = '';
  String date = '';
  String people = '';
  String late = '';
  String doesnt = '';
  String lesson = '';
  String theme = '';
  String purpose = '';
  String first_1 = '';
  String first_2 = '';
  String first_3 = '';
  String first_4 = '';
  String second_1 = '';
  String second_2 = '';
  String second_3 = '';
  String second_4 = '';
  String third_1 = '';
  String fourth_1 = '';
  String fifth_1 = '';
  String six_1 = '';
  String six_2 = '';
  String six_3 = '';
  String seven_1 = '';
  String seven_2 = '';
  String seven_3 = '';
  String eight_1 = '';
  String nine_1 = '';
  String ten_1 = '';
  String conclusions = '';
  String remarks = '';
  String total = '';
  String imgURL = '';

  Future getInfo() async {
    try {
      var collectionRef = await FirebaseFirestore.instance.collection('teachers').doc(AnalysesLesson.name).collection('open_lesson').doc(LessonDetailsPage.date).get();
      setState(() {
        group = collectionRef['group'];
        date = collectionRef['date'];
        people = collectionRef['people'];
        late = collectionRef['late'];
        doesnt = collectionRef['doesnt'];
        lesson = collectionRef['lesson'];
        theme = collectionRef['theme'];
        purpose = collectionRef['purpose'];
        first_1 = collectionRef['1.1'];
        first_2 = collectionRef['1.2'];
        first_3 = collectionRef['1.3'];
        first_4 = collectionRef['1.4'];
        second_1 = collectionRef['2.1'];
        second_2 = collectionRef['2.2'];
        second_3 = collectionRef['2.3'];
        second_4 = collectionRef['2.4'];
        third_1 = collectionRef['3.1'];
        fourth_1 = collectionRef['4.1'];
        fifth_1 = collectionRef['5.1'];
        six_1 = collectionRef['6.1'];
        six_2 = collectionRef['6.2'];
        six_3 = collectionRef['6.3'];
        seven_1 = collectionRef['7.1'];
        seven_2 = collectionRef['7.2'];
        seven_3 = collectionRef['7.3'];
        eight_1 = collectionRef['8.1'];
        nine_1 = collectionRef['9.1'];
        ten_1 = collectionRef['10.1'];
        conclusions = collectionRef['conclusion'];
        remarks = collectionRef['remark'];
        total = collectionRef['total'];
        imgURL = collectionRef['image'];
      });
    } catch (e) {
      rethrow;
    }
  }


  @override
  void initState(){
    AnalysesLesson.name;
    AnalysesLesson.index;
    LessonDetailsPage.date;
    getInfo();
    initFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
