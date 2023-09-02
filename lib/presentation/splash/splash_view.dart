import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/image_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () {
      _goNext();
    });
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      /*appBar: AppBar(
        title: Text("Splash Screen"),
      ),*/
      body: Container(
        color: ColorManager.primary,
        alignment: Alignment.center,
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
