import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_presenter.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:videoflix/domain/utils/constants.dart';
// import 'package:videoflix/app/utils/constants.dart';

class HomeController extends Controller {
  ScrollController scrollController = ScrollController();
  Color navbarBackgroundColor = UIConstants.navbarBackgroundColor;
  HomePresenter _homePresenter;

  HomeController() : _homePresenter = HomePresenter() {
    initListeners();
  }

  /// Initializes [Presenter] listeners
  void initListeners() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels < 30.0) {
          navbarBackgroundColor = UIConstants.navbarBackgroundColor;
        }
      } else {
        navbarBackgroundColor = Colors.transparent;
      }
      refreshUI();
    });
  }
}
