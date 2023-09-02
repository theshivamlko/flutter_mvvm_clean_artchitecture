import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/image_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  PageController pageController=PageController(initialPage: 0);

  var list=[
    SliderObjects("Title1", "SubTitle1", ImageAssets.fbLogo),
    SliderObjects("Title2", "SubTitle2", ImageAssets.fbLogo),
    SliderObjects("Title3", "SubTitle3", ImageAssets.fbLogo)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.purple,
          statusBarBrightness: Brightness.dark,
        ),
      ),

    );
  }
}

class SliderObjects {
  String title, subtitle, image;

  SliderObjects(this.title, this.subtitle, this.image);
}
