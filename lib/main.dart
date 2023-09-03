import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/app/app.dart';
import 'package:flutter_mvvm_clean_artchitecture/app/di.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();
  await Future.delayed(Duration(seconds: 2));

  runApp(MyApp());
}



