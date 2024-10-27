
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/animation/custom_page_route.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/theme/theme.dart';
import 'package:nadezda/widgets/shared_data.dart';

class TeachersListForGuest extends StatefulWidget {
  const TeachersListForGuest({super.key});

  @override
  State<TeachersListForGuest> createState() => _TeachersListForGuestState();
}

class _TeachersListForGuestState extends State<TeachersListForGuest> {

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState(){
    SharedData.initStatus();
    initFirebase();
    super.initState();
  }

  TextEditingController name_controller = TextEditingController();
  TextEditingController birthday_controller = TextEditingController();
  TextEditingController category_controller = TextEditingController();
  TextEditingController specific_controller = TextEditingController();

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
          title: Text('СПИСОК ПЕДАГОГОВ', style: theme.textTheme.displayMedium,),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('teachers').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData) {return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text ('Проверьте интернет соединение', style: theme.textTheme.displayMedium,),
            );}
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index){
                  return TeacherCard(
                        push: (){
                          TeacherPage.name = '${snapshot.data!.docs[index].get('surname')} ${snapshot.data!.docs[index].get('name')} ${snapshot.data!.docs[index].get('lastname')} ';
                          Navigator.of(context).push(CustomPageRoute(child: const TeacherPage()));
                          },
                  teacher_surname: snapshot.data!.docs[index].get('surname'),
                  teacher_name: snapshot.data!.docs[index].get('name'),
                  teacher_lastname: snapshot.data!.docs[index].get('lastname'),
                  teacher_profession: snapshot.data!.docs[index].get('specific'));
                }
            );
          },
        ),
      ),
    );
  }
}