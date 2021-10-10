import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

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

  @override
  Widget get desktopView => Scaffold(
        key: globalKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Row(
                children: [
                  ControlledWidgetBuilder<HomeController>(
                    builder: (context, controller) {
                      return Container(
                        child: Text('Navbar'),
                        height: 60.0,
                        color: controller.navbarBackgroundColor,
                      );
                    },
                  ),
                ],
              ),
              ListView(
                controller: controller.scrollController,
                children: [
                  SizedBox(height: 60.0),
                  SizedBox(
                    height: 2000.0,
                    child: Text('Desktop body'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

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
  Widget get tabletView => MediaQuery.of(context).size.height < 415
      ? mobileViewSideways
      : Scaffold(
          key: globalKey,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Text('Tablet'),
          ),
        );
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
