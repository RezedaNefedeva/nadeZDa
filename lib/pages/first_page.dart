
import 'package:flutter/material.dart';
import 'package:nadezda/animation/custom_page_route.dart';
import 'package:nadezda/export.dart';
import 'package:nadezda/widgets/shared_data.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  TextEditingController pass_controller = TextEditingController();

  @override
  void initState() {
    SharedData.initStatus();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/logo.png', height: 100,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ВОЙТИ КАК:', style: theme.textTheme.displayMedium,),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(CustomPageRoute(child: const TeachersListForGuest()));
                  },
                    child: RedBtn(
                        text: 'ГОСТЬ',
                        width: MediaQuery.of(context).size.width-40,
                        height: 60)),
                const SizedBox(height: 40,),
                InkWell(
                    onTap: (){
                      if(SharedData.status!='admin'){
                        showDialog(context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text('Введите пароль', style: theme.textTheme.displayMedium, textAlign: TextAlign.center,),
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    children: [Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width-140,
                                          height: 48,
                                          child: CustomTextField(
                                            controller: pass_controller,
                                            text_style: theme.textTheme.titleLarge,),
                                        )
                                      ],
                                    ),
                                      const SizedBox(height: 20,),
                                      InkWell(
                                        onTap: (){
                                          launch('whatsapp://send?phone=+79279589087');
                                        },
                                        child: Text('Забыли пароль?', style: theme.textTheme.bodySmall,),
                                      )
                                    ]
                                  ),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: const RedBtn(text: 'Отмена', width: 120, height: 48),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          if(pass_controller.text == '2110nadeZDa!'){
                                            setState(() {
                                              SharedData.setAdmin('admin');
                                            });
                                            Navigator.pop(context);
                                            pass_controller.text = '';
                                            Navigator.of(context).push(CustomPageRoute(child: const TeachersListPage()));
                                          } else if(pass_controller.text != '2110nadeZDa!'){
                                            showDialog(context: context,
                                                builder: (context){
                                                  return AlertDialog(
                                                    title: Text('Пароль не верный'),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                              Navigator.pop(context);
                                                            },
                                                            child: const RedBtn(text: 'Отмена', width: 120, height: 48),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: const RedBtn(text: 'Еще раз', width: 120, height: 48),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  );
                                                });
                                          }
                                        },
                                        child: const RedBtn(text: 'Готово', width: 120, height: 48),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                      } else {
                        Navigator.of(context).push(CustomPageRoute(child: const TeachersListPage()));
                      }
                    },
                    child: RedBtn(
                        text: 'МЕТОДИСТ',
                        width: MediaQuery.of(context).size.width-40,
                        height: 60)),
                const SizedBox(height: 200,),
              ],
            ),
      ),
    );
  }
}
