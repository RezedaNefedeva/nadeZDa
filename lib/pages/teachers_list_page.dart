
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/animation/custom_page_route.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/theme/theme.dart';
import 'package:nadezda/widgets/shared_data.dart';

class TeachersListPage extends StatefulWidget {
  const TeachersListPage({super.key});

  @override
  State<TeachersListPage> createState() => _TeachersListPageState();
}

class _TeachersListPageState extends State<TeachersListPage> {

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

  TextEditingController surname_controller = TextEditingController();
  TextEditingController name_controller = TextEditingController();
  TextEditingController lastname_controller = TextEditingController();
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
          actions: [
            InkWell(
            onTap: (){
              SharedData.exitStatus();
              Navigator.of(context).push(CustomPageRoute(child: const FirstPage()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Выйти', style: theme.textTheme.bodySmall,),
            )
          ),]
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
                          TeacherPageAdmin.name = '${snapshot.data!.docs[index].get('surname')} ${snapshot.data!.docs[index].get('name')} ${snapshot.data!.docs[index].get('lastname')} ';
                          Navigator.of(context).push(
                              CustomPageRoute(child: const TeacherPageAdmin()));
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
      floatingActionButton:
      FloatingActionButton.extended(onPressed: (){
        showDialog(context: context,
            builder: (context){
          return AlertDialog(
            title: Text('Внесите данные педагога', style:  theme.textTheme.displayMedium, textAlign:  TextAlign.center,),
            content: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width-140,
                child: Column(
                  children: [
                    CustomTextFieldWithHint(
                        controller: surname_controller,
                        text_style: theme.textTheme.titleMedium,
                        text_hint: 'Фамилия',
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFieldWithHint(
                      controller: name_controller,
                      text_style: theme.textTheme.titleMedium,
                      text_hint: 'Имя',
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFieldWithHint(
                      controller: lastname_controller,
                      text_style: theme.textTheme.titleMedium,
                      text_hint: 'Отчество',
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFieldWithHint(
                      controller: birthday_controller,
                      text_style: theme.textTheme.titleMedium,
                      text_hint: 'Дата рождения',
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFieldWithHint(
                      controller: category_controller,
                      text_style: theme.textTheme.titleMedium,
                      text_hint: 'Категория',
                    ),
                    const SizedBox(height: 20,),
                    CustomTextFieldWithHint(
                      controller: specific_controller,
                      text_style: theme.textTheme.titleMedium,
                      text_hint: 'Специализация',
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const RedBtn(text: 'Отмена', width: 120, height: 48),
                  ),
                  InkWell(
                    onTap: (){
                      FirebaseFirestore.instance.collection('teachers').doc(
                          '${surname_controller.text} ${name_controller.text} ${lastname_controller.text} ').set(
                        {
                          'name' : name_controller.text,
                          'surname' : surname_controller.text,
                          'lastname' : lastname_controller.text,
                          'birthday' : birthday_controller.text,
                          'category' : category_controller.text,
                          'specific' : specific_controller.text
                        }
                      );
                      setState(() {
                        name_controller.text = '';
                        lastname_controller.text = '';
                        surname_controller.text = '';
                        birthday_controller.text = '';
                        category_controller.text = '';
                        specific_controller.text = '';
                      });
                      Navigator.pop(context);
                    },
                    child: const RedBtn(text: 'Добавить', width: 120, height: 48),
                  ),
                ],
              )
            ],
          );
            });
      },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
        label: Text('Добавить педагога', style: theme.textTheme.bodyLarge),
        icon: const Icon(Icons.add, color: Colors.white,),
      backgroundColor: red(),
      )
    );
  }
}
