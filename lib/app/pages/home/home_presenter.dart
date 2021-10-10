import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  // Controller Callback functions
  late Function homeOnComplete;
  late Function homeOnError;

  HomePresenter();

  void dispose() {}
}
