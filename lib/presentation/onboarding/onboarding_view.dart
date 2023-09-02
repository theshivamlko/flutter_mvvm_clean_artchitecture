import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/SliderObject.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/onboarding/onboarding_viewmodel.dart';
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

  OnBoardingViewModel _boardingViewModel = OnBoardingViewModel();

  _bind() {
    _boardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _boardingViewModel.dispose();
    super.dispose();
  }

  Widget getContent(SlideViewObject? slideViewObject) {
    if (slideViewObject == null) {
      return Container();
    } else {
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
            itemBuilder: (ctx, index) =>
                itemBuilder(ctx, index, slideViewObject),
            itemCount: slideViewObject.noOfSlides,
            controller: pageController,
            onPageChanged:_boardingViewModel.onPageChange,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
        stream: _boardingViewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return getContent(snapshot.data);
        });
  }

  Widget itemBuilder(ctx, index, SlideViewObject? slideViewObject) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            slideViewObject?.sliderObjects.title ?? "",
            style: StyleManager.getHeadlineStyle(color: Colors.white),
          ),
          ElevatedButton(
              onPressed: () {
                pageController.animateToPage(_boardingViewModel.goNext(),
                    duration: Duration(seconds: 1), curve: Curves.bounceIn);

                //     Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: Text("NEXT"))
        ],
      ),
    );
  }
}
