abstract class BaseViewModel extends BaseViewModelInput
    implements BaseViewModelOutput {
  // shared variables and functions
  // that will be used  through any view model
}

abstract class BaseViewModelInput {
  // initialize view model
  void start();

  // when viewmodel destroy
  void dispose();
}

abstract class BaseViewModelOutput {}
