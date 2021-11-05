import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_presenter.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:videoflix/app/utils/constants.dart';

class HomeController extends Controller {
  HomePresenter _homePresenter;
  ScrollController scrollController = ScrollController();
  Color navbarBackgroundColor = Colors.transparent;
  List<DropdownMenuItem<String>>? categorieOptions;
  String? selectedCategorie;

  HomeController() : _homePresenter = HomePresenter() {
    initListeners();
    categorieOptions = [
      DropdownMenuItem<String>(
        value: 'default',
        child: Text('Categorias'),
      ),
      DropdownMenuItem<String>(
        value: '1',
        child: Text('Categoria 1'),
      ),
      DropdownMenuItem<String>(
        value: '2',
        child: Text('Categoria 2'),
      ),
    ];
    selectedCategorie = 'default';
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

  void changeSelectedCategorie(String? newCategorie) {
    selectedCategorie = newCategorie;
    refreshUI();
  }
}
