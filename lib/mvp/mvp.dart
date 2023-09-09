import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/presenter/Page1.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/presentation/resources/theme_manager.dart';

class MVPApp extends StatefulWidget {
  MVPApp._internal();

  int appState = 0;

  // Singleton
  static final MVPApp instance = MVPApp._internal();

  factory MVPApp() => instance;

  @override
  State<MVPApp> createState() => _MyAppState();
}

class _MyAppState extends State<MVPApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getAppTheme(),
      home: Page1(),
    );
  }
}
