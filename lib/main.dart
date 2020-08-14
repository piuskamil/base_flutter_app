import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'application/lang/lang.dart';
import 'injection.dart';

void main() {
  configureDependencies(Environment.dev);
  final LangModel _langModel = serviceLocator<LangModel>();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<LangModel>(create: (_) => _langModel),
      ],
      child: App(),
    ),
  );
}

