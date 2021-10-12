import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_presenter.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:videoflix/domain/utils/constants.dart';
// import 'package:videoflix/app/utils/constants.dart';

class HomeController extends Controller {
  ScrollController scrollController = ScrollController();
  Color navbarBackgroundColor = Colors.transparent;
  HomePresenter _homePresenter;

  HomeController() : _homePresenter = HomePresenter() {
    initListeners();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  /// Initializes [Presenter] listeners
  void initListeners() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10.0) {
        navbarBackgroundColor = UIConstants.navbarBackgroundColor;
      } else {
        navbarBackgroundColor = Colors.transparent;
      }
      refreshUI();
    });
  }
}
