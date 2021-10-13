import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/components/categories_selector.dart';
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
        body: Container(
          child: Stack(
            // CategoriesSelector(),
            children: [
              ListView.builder(
                controller: controller.scrollController,
                itemCount: null,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Stack(
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
                        Column(
                          children: [
                            SizedBox(height: 60.0),
                            CategoriesSelector(),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: UIConstants.horizontalPadding),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 500.0,
                                maxWidth: 800.0,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'images/deadlySins.webp',
                                      width: double.infinity,
                                    ),
                                    SizedBox(height: 30.0),
                                    Text(
                                      'Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Sapien in monti palavris qui num significa nadis i pareci latim. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. Quem num gosta di mim que vai caçá sua turmis!',
                                    ),
                                    SizedBox(height: 30.0),
                                    Row(children: [
                                      ElevatedButton(
                                        onPressed: () => print('pressed'),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.play_arrow,
                                            ),
                                            Text('Play'),
                                            SizedBox(width: 6.0),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      ElevatedButton(
                                        onPressed: () => print('pressed 2'),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.info_outline_rounded,
                                            ),
                                            SizedBox(width: 4.0),
                                            Text('More info'),
                                            SizedBox(width: 6.0),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Container(
                        //           width: MediaQuery.of(context).size.width / 2,
                        //         ),
                        //         Column(
                        //           children: [
                        //             Image.asset('images/deadlySins.webp'),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    );
                  } else {
                    return Text(index.toString());
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
