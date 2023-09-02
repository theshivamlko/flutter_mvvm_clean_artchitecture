

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/app/app.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  void updateAppState(){
    MyApp.instance.appState=100;
  }
  void getAppState(){
   print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
