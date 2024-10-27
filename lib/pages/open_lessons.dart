
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/animation/custom_page_route.dart';

class OpenLessons extends StatefulWidget {
  static String name = '';
  const OpenLessons({super.key});

  @override
  State<OpenLessons> createState() => _OpenLessonsState();
}

class _OpenLessonsState extends State<OpenLessons> {

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    OpenLessons.name = TeacherPage.name;
    initFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo.png', height: 100,),
        centerTitle: true,
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('ОТКРЫТЫЕ УРОКИ', style: theme.textTheme.displayMedium,),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('teachers').doc(OpenLessons.name).collection('open_lesson').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData) {return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text ('Проверьте интернет соединение', style: theme.textTheme.displayMedium,),
            );} else if (snapshot.data!.docs.length == 0){
              return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text ('У этого преподавателя еще не было открытых уроков',textAlign: TextAlign.center, style: theme.textTheme.displayMedium,));
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: grey(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      onTap: (){
                        LessonDetailsPage.date = snapshot.data!.docs[index].get('date');
                        Navigator.of(context).push(CustomPageRoute(child: const LessonDetailsPage()));
                      },
                      title: Text(snapshot.data!.docs[index].get('date'), style: theme.textTheme.bodyLarge,),
                      subtitle: Text(snapshot.data!.docs[index].get('theme'), style: theme.textTheme.bodyLarge,),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    ),
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
