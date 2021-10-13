import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, snapshot) {
              return Container(
                height: 60.0,
                color: FlutterCleanArchitecture.getController<HomeController>(
                        context)
                    .navbarBackgroundColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            WebsafeSvg.asset(
                              'assets/images/logo.svg',
                              fit: BoxFit.contain,
                              height: 30.0,
                            ),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            GestureDetector(
                              child: Text(AppLocalizations.of(context)!.home),
                              onTap: () => FlutterCleanArchitecture
                                      .getController<HomeController>(context,
                                          listen: false)
                                  .scrollToTop(),
                            ),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            GestureDetector(
                              child: Text(AppLocalizations.of(context)!.series),
                              onTap: () => FlutterCleanArchitecture
                                      .getController<HomeController>(context,
                                          listen: false)
                                  .scrollToTop(),
                            ),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            GestureDetector(
                              child: Text(AppLocalizations.of(context)!.movies),
                              onTap: () => FlutterCleanArchitecture
                                      .getController<HomeController>(context,
                                          listen: false)
                                  .scrollToTop(),
                            ),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            GestureDetector(
                              child: Text(AppLocalizations.of(context)!.myList),
                              onTap: () => FlutterCleanArchitecture
                                      .getController<HomeController>(context,
                                          listen: false)
                                  .scrollToTop(),
                            ),
                          ],
                        ),
                        Row(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
