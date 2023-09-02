import 'dart:async';

import 'package:flutter_mvvm_clean_artchitecture/domain/SliderObject.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/base/BaseViewModel.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/onboarding/onboarding_view.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/resources/image_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controllers

  final StreamController<SlideViewObject> _streamController =
      StreamController<SlideViewObject>();

  late List<SliderObjects> list;

  /* = [
    SliderObjects("Title1", "SubTitle1", ImageAssets.fbLogo),
    SliderObjects("Title2", "SubTitle2", ImageAssets.fbLogo),
    SliderObjects("Title3", "SubTitle3", ImageAssets.fbLogo)
  ];*/

  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    list = _getList();

    _postDataToView();
  }

  @override
  void goNext() {
    if (_currentIndex < 2) {
      print(_currentIndex);
      ++_currentIndex;
    }
    _postDataToView();
  }

  @override
  void goPrevious() {
    if (_currentIndex > 0) {
      print(_currentIndex);
      --_currentIndex;
    }
    _postDataToView();
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // add input here
  Sink<SlideViewObject> get inputSliderViewObject => _streamController.sink;

  @override
  // trigger above input and get value here to evaluate
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObjects> _getList() {
    return [
      SliderObjects("Title1", "SubTitle1", ImageAssets.fbLogo),
      SliderObjects("Title2", "SubTitle2", ImageAssets.fbLogo),
      SliderObjects("Title3", "SubTitle3", ImageAssets.fbLogo)
    ];
  }

  _postDataToView() {
    inputSliderViewObject
        .add(SlideViewObject(list.first, list.length, _currentIndex));
  }
}

// input from view to view model
abstract class OnBoardingViewModelInputs {
  void goNext(); // next PageView
  void goPrevious(); // previous PageView
  void onPageChange(int index);

  Sink<SlideViewObject> get inputSliderViewObject;
}

// result from viewmodel to view
abstract class OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObjects sliderObjects;
  int noOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObjects, this.noOfSlides, this.currentIndex);
}
