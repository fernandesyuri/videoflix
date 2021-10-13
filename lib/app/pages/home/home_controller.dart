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
        value: 'abc123',
        child: Text('Teste 2'),
      ),
      DropdownMenuItem<String>(
        value: 'a',
        child: Text('Teste 23'),
      ),
    ];
    selectedCategorie = 'a';
    // categorieOptions = [
    //   DropdownMenuItem<String>(
    //     value: null,
    //     child: Text(AppLocalizations.of(getContext())!.categoriesPlaceholder),
    //   )
    // ];
    // selectedCategorie =
    //     AppLocalizations.of(getContext())!.categoriesPlaceholder;
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
