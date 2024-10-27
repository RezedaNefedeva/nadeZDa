
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/animation/custom_page_route.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/pages/analyses_lesson.dart';
import 'package:nadezda/widgets/shared_data.dart';

class TeacherPageAdmin extends StatefulWidget {
  static String name = '';
  const TeacherPageAdmin({super.key});

  @override
  State<TeacherPageAdmin> createState() => _TeacherPageAdminState();
}

class _TeacherPageAdminState extends State<TeacherPageAdmin> {

  String surname = '';
  String name = '';
  String lastname = '';
  String birthday = '';
  String category = '';
  String specific = '';

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future getInfo() async {
    try {
      var collectionRef = await FirebaseFirestore.instance.collection('teachers').doc(TeacherPageAdmin.name).get();
      setState(() {
        surname = collectionRef['surname'];
        name = collectionRef['name'];
        lastname = collectionRef['lastname'];
        birthday = collectionRef['birthday'];
        category = collectionRef['category'];
        specific = collectionRef['specific'];
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState(){
    SharedData.initStatus();
    TeacherPage.name;
    getInfo();
    initFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo.png', height: 100,),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(surname, style: theme.textTheme.displayLarge),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: theme.textTheme.displayLarge),
                const SizedBox(width: 6,),
                Text(lastname, style: theme.textTheme.displayLarge),
              ],
            ),
            const SizedBox(height: 60,),
            Row(
              children: [
                Text('Дата рождения: ', style: theme.textTheme.titleMedium),
                const SizedBox(width: 6,),
                Text(birthday, style: theme.textTheme.displayMedium),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text('Категория: ', style: theme.textTheme.titleMedium),
                const SizedBox(width: 6,),
                Text(category, style: theme.textTheme.displayMedium),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text('Специализация: ', style: theme.textTheme.titleMedium),
                const SizedBox(width: 6,),
                Text(specific, style: theme.textTheme.displayMedium),
              ],
            ),
            const SizedBox(height: 60,),
            InkWell(
              onTap: (){
                AnalysesLesson.name = '$surname $name $lastname ';
                AnalysesLesson.index = 0;
                Navigator.of(context).push(
                    CustomPageRoute(child: const AnalysesLesson()));
              },
              child: SmallGreyBtn(
                width: MediaQuery.of(context).size.width-40,
                height: 100,
                first_text: 'Оценить открытый урок',
                first_text_style: theme.textTheme.labelLarge,),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                AnalysesLesson.index = 1;
              },
              child: SmallGreyBtn(
                width: MediaQuery.of(context).size.width-40,
                height: 100,
                first_text: 'Оценить практическую работу',
                first_text_style: theme.textTheme.labelLarge,),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                AnalysesLesson.index = 2;
              },
              child: SmallGreyBtn(
                width: MediaQuery.of(context).size.width-40,
                height: 100,
                first_text: 'Оценить внеурочное занятие',
                first_text_style: theme.textTheme.labelLarge,),
            ),
          ],
        ),
      ),
    );
  }
}
