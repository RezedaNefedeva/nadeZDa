
import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/widgets/get_image.dart';

class AnalysesLesson extends StatefulWidget {
  static String name ='';
  static int index = 0;
  const AnalysesLesson({super.key});

  @override
  State<AnalysesLesson> createState() => _AnalysesLessonState();
}

class _AnalysesLessonState extends State<AnalysesLesson> {

  String surname = '';
  String name = '';
  String lastname = '';

  List<String> lesson_type = ['open_lesson', 'practic_work', 'activities'];

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future getInfo() async {
    try {
      var collectionRef = await FirebaseFirestore.instance.collection('teachers').doc(AnalysesLesson.name).get();
      setState(() {
        surname = collectionRef['surname'];
        name = collectionRef['name'][0];
        lastname = collectionRef['lastname'][0];
      });
    } catch (e) {
      rethrow;
    }
  }


@override
  void initState(){
    AnalysesLesson.name;
    AnalysesLesson.index;
    getInfo();
    initFirebase();
    super.initState();
  }

  TextEditingController group_controller = TextEditingController();
  TextEditingController date_controller = TextEditingController();
  TextEditingController people_controller = TextEditingController();
  TextEditingController late_come_controller = TextEditingController();
  TextEditingController doesnt_come_controller = TextEditingController();
  TextEditingController lesson_module_controller = TextEditingController();
  TextEditingController theme_lesson_controller = TextEditingController();
  TextEditingController purpose_controller = TextEditingController();
  TextEditingController first_1_controller = TextEditingController();
  TextEditingController first_2_controller = TextEditingController();
  TextEditingController first_3_controller = TextEditingController();
  TextEditingController first_4_controller = TextEditingController();
  TextEditingController second_1_controller = TextEditingController();
  TextEditingController second_2_controller = TextEditingController();
  TextEditingController second_3_controller = TextEditingController();
  TextEditingController second_4_controller = TextEditingController();
  TextEditingController third_1_controller = TextEditingController();
  TextEditingController fourth_1_controller = TextEditingController();
  TextEditingController fifth_1_controller = TextEditingController();
  TextEditingController six_1_controller = TextEditingController();
  TextEditingController six_2_controller = TextEditingController();
  TextEditingController six_3_controller = TextEditingController();
  TextEditingController seven_1_controller = TextEditingController();
  TextEditingController seven_2_controller = TextEditingController();
  TextEditingController seven_3_controller = TextEditingController();
  TextEditingController eight_1_controller = TextEditingController();
  TextEditingController nine_1_controller = TextEditingController();
  TextEditingController ten_1_controller = TextEditingController();
  TextEditingController conclusions_controller = TextEditingController();
  TextEditingController remarks_controller = TextEditingController();

  int total = 0;

  int getTotal(){
    setState(() {
      total = int.parse(first_1_controller.text)
          + int.parse(first_2_controller.text)
          + int.parse(first_3_controller.text)
          + int.parse(first_4_controller.text)
          + int.parse(second_1_controller.text)
          + int.parse(second_2_controller.text)
          + int.parse(second_3_controller.text)
          + int.parse(second_4_controller.text)
          + int.parse(third_1_controller.text)
          + int.parse(fourth_1_controller.text)
          + int.parse(fifth_1_controller.text)
          + int.parse(six_1_controller.text)
          + int.parse(six_2_controller.text)
          + int.parse(six_3_controller.text)
          + int.parse(seven_1_controller.text)
          + int.parse(seven_2_controller.text)
          + int.parse(seven_3_controller.text)
          + int.parse(eight_1_controller.text)
          + int.parse(nine_1_controller.text)
          + int.parse(ten_1_controller.text);
    });
    return total;
  }

  String imgURL = '';

  Future uploadImg(BuildContext context) async {
    String fileName = '${AnalysesLesson.name} ${date_controller.text}';
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('teachers');
    Reference uploadRef = firebaseStorageRef.child(fileName);
    try{
      final uploatTask = await uploadRef.putFile(File(getImage.image!.path));
      setState(() async {
        imgURL = await (uploatTask).ref.getDownloadURL();
        FirebaseFirestore.instance.collection('teachers').doc(AnalysesLesson.name).collection('${lesson_type[AnalysesLesson.index]}').doc(date_controller.text).set({
          'group' : group_controller.text,
          'date' : date_controller.text,
          'people' : people_controller.text,
          'late' : late_come_controller.text,
          'doesnt' : doesnt_come_controller.text,
          'lesson' : lesson_module_controller.text,
          'theme' : theme_lesson_controller.text,
          'purpose' : purpose_controller.text,
          '1.1' : first_1_controller.text,
          '1.2' : first_2_controller.text,
          '1.3' : first_3_controller.text,
          '1.4' : first_4_controller.text,
          '2.1' : second_1_controller.text,
          '2.2' : second_2_controller.text,
          '2.3' : second_3_controller.text,
          '2.4' : second_4_controller.text,
          '3.1' : third_1_controller.text,
          '4.1' : fourth_1_controller.text,
          '5.1' : fifth_1_controller.text,
          '6.1' : six_1_controller.text,
          '6.2' : six_2_controller.text,
          '6.3' : six_3_controller.text,
          '7.1' : seven_1_controller.text,
          '7.2' : seven_2_controller.text,
          '7.3' : seven_3_controller.text,
          '8.1' : eight_1_controller.text,
          '9.1' : nine_1_controller.text,
          '10.1' : ten_1_controller.text,
          'conclusion' : conclusions_controller.text,
          'remark' : remarks_controller.text,
          'total' : total,
          'image' : imgURL,
        });
      });
    } catch (error){
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo.png', height: 100,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text('АНАЛИЗ УРОКА', style: theme.textTheme.displayMedium,),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Text('Преподаватель:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Flexible(child: Text('$surname $name. $lastname.', style: theme.textTheme.displayMedium,))
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Группа:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: group_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Дата:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: date_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Слушателей по списку:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: people_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Опоздало:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: late_come_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Отсутствуют:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: doesnt_come_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Предмет (модуль):', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: lesson_module_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Тема урока:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextField(controller: theme_lesson_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('Цель занятия:', style: theme.textTheme.titleMedium,),
                  const SizedBox(width: 16,),
                  Expanded(
                      child: CustomTextFieldMulty(controller: purpose_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знание основ и принципов психологии и педагогики, андрогогики и конфиликтологии', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n14', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Конкретность, четкость и лаконичность формулировки цели урока', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: first_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Достигается ли цель на уроке', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: first_2_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Рациональность использования времени урока, оптимальность темпа чередования и смены видов деятельности на занятии', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: first_3_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Темп урока (высокий, выше среднего, средний, ниже среднего, низкий)', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: first_4_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знание содержания изучаемого материала', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n16', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Научность, доступность, посильность изучаемого материала', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: second_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Новизна, проблемность и привлекательность учебной информации', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: second_2_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Оптимальность объема материала, предложенного для усвоения', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: second_3_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Актуальность и связь теории с практикой', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: second_4_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки ораторского мастерства, презентационные навыки', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n4', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки ораторского мастерства, презентационные навыки', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: third_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки установления контакта с аудиторией', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n4', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки установления контакта с аудиторией', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: fourth_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки активного слушания', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n3', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки активного слушания', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: fifth_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знания методов и инструментов управления групповой динамикой', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n11', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Наличие и эффективность коллективных (групповых) форм работы в ходе урока', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: six_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Уровень дисциплины учащихся', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: six_2_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Психологическая атмосфера на уроке', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: six_3_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знание форм проведения обучения активными методами, современных технологиий обучения, навыки их применения в соответствии с целями программ профессионального обучения', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n12', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Рациональность и эффективность методов и организационных форм работы', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: seven_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Целесообразность использования приемой наглядности и ТСО', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: seven_2_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знание методик проведения практических занятий', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: seven_3_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знание методов оценки знаний обучающихся и навыки их применения в процессе обучения', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n4', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Знание методов оценки знаний обучающихся и навыки их применения в процессе обучения', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: eight_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки предоставления обратной связи', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n4', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Навыки предоставления обратной связи', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: nine_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Соблюдение правил ОТ и техники безопасности в ходе занятий', style: theme.textTheme.displaySmall,)),
                  Flexible(child: Text('Max оценка\n4', style: theme.textTheme.displaySmall, textAlign: TextAlign.center,)),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Text('Соблюдение правил ОТ и техники безопасности в ходе занятий', style: theme.textTheme.titleSmall,)),
                  Expanded(
                      child: CustomTextField(controller: ten_1_controller, text_style: theme.textTheme.displayMedium)),
                ],
              ),
              const SizedBox(height: 40.0,),
              SizedBox(
                  width: MediaQuery.of(context).size.width*0.75,
                  child: Text('Выводы и предложения', style: theme.textTheme.displaySmall,)),
              const SizedBox(height: 10,),
              CustomTextFieldMulty(controller: conclusions_controller, text_style: theme.textTheme.displayMedium),
              const SizedBox(height: 40.0,),
              SizedBox(
                  width: MediaQuery.of(context).size.width*0.75,
                  child: Text('Замечания по организации учебного процесса', style: theme.textTheme.displaySmall,)),
              const SizedBox(height: 10,),
              CustomTextFieldMulty(controller: remarks_controller, text_style: theme.textTheme.displayMedium),
              const SizedBox(height: 40.0,),
              Text('Выбрать фото урока', style: theme.textTheme.displayMedium,),
              const getImage(),
              const SizedBox(height: 40.0,),
              InkWell(
                onTap: ()async{
                  getTotal();
                  print('!!!!!!!!!!!!!!!$total');
                  await uploadImg(context);
                },
                child: RedBtn(
                    text: 'Добавить',
                    width: MediaQuery.of(context).size.width-20,
                    height: 60),
              ),
              const SizedBox(height: 40.0,),
            ],
          ),
        ),
      ),
    );
  }
}