import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/components/navbar_item.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, snapshot) {
        final HomeController controller =
            FlutterCleanArchitecture.getController<HomeController>(context);
        final AppLocalizations localizations = AppLocalizations.of(context)!;
        return AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: UIConstants.navbarHeight,
          color: controller.navbarBackgroundColor,
          duration: Duration(milliseconds: 150),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: UIConstants.horizontalPadding),
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
                            NavBarTextItem(
                              text: localizations.home,
                              homeController: controller,
                            ),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            NavBarTextItem(text: localizations.series),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            NavBarTextItem(text: localizations.movies),
                            SizedBox(width: UIConstants.navbarItemsDistance),
                            NavBarTextItem(text: localizations.myList),
                          ],
                        ),
                        Row(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: UIConstants.horizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: controller.isSearchBarVisible,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: AnimatedContainer(
                            curve: Curves.fastOutSlowIn,
                            width: controller.searchBarWidth,
                            height: 100.0,
                            duration: Duration(milliseconds: 200),
                            child: Focus(
                              onFocusChange: (focus) {
                                if (focus == false &&
                                    controller.searchInputString.length == 0) {
                                  controller.toggleSearchBarVisible();
                                }
                              },
                              child: TextField(
                                cursorColor: Colors.white,
                                focusNode: controller.searchInputFocusNode,
                                onChanged: (value) =>
                                    controller.searchInputString = value,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                  fillColor: UIConstants.navbarBackgroundColor,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: UIConstants.searchInputBorderColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: UIConstants.searchInputBorderColor,
                                    ),
                                  ),
                                  hintText: localizations.search,
                                  prefixIcon: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: controller.toggleSearchBarVisible,
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !controller.isSearchBarVisible,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: controller.toggleSearchBarVisible,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: UIConstants.navbarIconsSize,
                              semanticLabel: localizations.search,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: UIConstants.navbarItemsDistance),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: UIConstants.navbarIconsSize,
                          semanticLabel: localizations.notifications,
                        ),
                      ),
                      SizedBox(width: UIConstants.navbarItemsDistance),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: UIConstants.navbarIconsSize,
                              semanticLabel: localizations.myAccount,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 16.0,
                              semanticLabel: localizations.myAccount,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
