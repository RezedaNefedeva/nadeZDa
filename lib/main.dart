import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nadezda/widgets/shared_data.dart';
import 'export.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedData.getAdmin();

  runApp(MaterialApp(
    theme: theme,
    initialRoute: '/',
    routes: routes,
  ));
}

