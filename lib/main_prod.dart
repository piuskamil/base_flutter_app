import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'logic/core/domain/initilize.dart';
import 'logic/lang/appliction/lang.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Environment.prod);
  final InitializeImp initializeImp = serviceLocator<InitializeImp>();
  await initializeImp.initialize();
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
