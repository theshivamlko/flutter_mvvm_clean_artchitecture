import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/di.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/mvp.dart';

import 'mvvm/app/app.dart';
import 'mvvm/app/di.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();
  await Future.delayed(Duration(seconds: 2));

  Injector.configure(Flavor.MOCK);
//  runApp(MyApp());
  runApp(MVPApp());
}



