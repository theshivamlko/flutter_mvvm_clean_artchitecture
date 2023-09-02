import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/SliderObject.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/image_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/routes_manager.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/style_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController(initialPage: 0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.purple,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          itemBuilder: itemBuilder,
          itemCount: list.length,
          controller: pageController,
          onPageChanged: (index) {},
        ));
  }

  Widget itemBuilder(ctx, index) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            list[index].title,
            style: StyleManager.getHeadlineStyle(color: Colors.white),
          ),
          ElevatedButton(
              onPressed: () {
                int i = index;
                if (i < 2) {
                  print(i);
                  pageController.animateToPage((++i),
                      duration: Duration(seconds: 1), curve: Curves.bounceIn);
                } else if (i == 2) {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }
              },
              child: Text("NEXT"))
        ],
      ),
    );
  }
}

