import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/components/carousel.dart';
import 'package:videoflix/app/pages/home/components/categories_selector.dart';
import 'package:videoflix/app/pages/home/components/header_info_and_buttons.dart';
import 'package:videoflix/app/pages/home/components/navbar.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';

class HomePage extends View {
  // HomePage({Key key, this.title}) : super(key: key);
  // HomePage(this.title);

  // final String title;
  final HomeController controller = HomeController();

  @override
  HomePageView createState() => HomePageView(controller);
}

class HomePageView extends ResponsiveViewState<HomePage, HomeController> {
  final HomeController controller;
  // final HomeController _homeController = HomeController(DataAuthenticationRepository());
  String email = "";
  String senha = "";

  HomePageView(this.controller) : super(controller);

  Widget get skeleton => Scaffold(
        key: globalKey,
        resizeToAvoidBottomInset: false,
        // body: CategoriesSelector(),
        body: Container(
          child: Stack(
            children: [
              ListView.builder(
                controller: controller.scrollController,
                itemCount: null,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/tron.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: UIConstants.pageBackgroundColor,
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    UIConstants.pageBackgroundColor
                                        .withOpacity(0.0),
                                    UIConstants.pageBackgroundColor,
                                  ],
                                  stops: [0.9, 1.0],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 80.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: UIConstants.horizontalPadding),
                              child: CategoriesSelector(),
                            ),
                            SizedBox(height: 40.0),
                            HeaderInfoAndButtons(),
                            SizedBox(height: 60.0),
                            Carousel(index),
                            SizedBox(height: 30.0),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                          child: Carousel(index),
                        ),
                      ],
                    );
                  }
                },
              ),
              Navbar(),
            ],
          ),
        ),
      );

  @override
  Widget get desktopView => skeleton;

  @override
  Widget get mobileView => MediaQuery.of(context).size.height < 415
      ? mobileViewSideways
      : Scaffold(
          key: globalKey,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Text('Mobile'),
          ),
        );

  Widget get mobileViewSideways => Scaffold(
        key: globalKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Text('Mobile sideways'),
        ),
      );

  @override
  Widget get tabletView =>
      MediaQuery.of(context).size.height < 415 ? mobileViewSideways : skeleton;
  @override
  Widget get watchView => Scaffold(
        key: globalKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Text('Watch'),
        ),
      );
}
