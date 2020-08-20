import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'logic/lang/appliction/lang.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies(Environment.prod);
  final LangModel _langModel = serviceLocator<LangModel>();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LangModel>(create: (_) => _langModel),
      ],
      child: App(),
    ),
  );
}
