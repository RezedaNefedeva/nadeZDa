
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/animation/custom_page_route.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/widgets/shared_data.dart';

class TeacherPage extends StatefulWidget {
  static String name = '';
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {

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
    print(TeacherPage.name);
    try {
      var collectionRef = await FirebaseFirestore.instance.collection('teachers').doc(TeacherPage.name).get();
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
                Navigator.of(context).push(CustomPageRoute(child: const OpenLessons()));
              },
              child: SmallGreyBtn(
                  width: MediaQuery.of(context).size.width-40,
                  height: 100,
                  first_text: 'Открытые уроки',
                  first_text_style: theme.textTheme.labelLarge,),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){

              },
              child: SmallGreyBtn(
                width: MediaQuery.of(context).size.width-40,
                height: 100,
                first_text: 'Практические работы',
                first_text_style: theme.textTheme.labelLarge,),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){

              },
              child: SmallGreyBtn(
                width: MediaQuery.of(context).size.width-40,
                height: 100,
                first_text: 'Внеурочные занятия',
                first_text_style: theme.textTheme.labelLarge,),
            ),
          ],
        ),
      ),
    );
  }
}
