import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';

class NavBarTextItem extends StatefulWidget {
  final String text;
  final HomeController? homeController;

  const NavBarTextItem({Key? key, required this.text, this.homeController})
      : super(key: key);

  @override
  _NavBarTextItemState createState() => _NavBarTextItemState();
}

class _NavBarTextItemState extends State<NavBarTextItem> {
  Color fontColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) => setState(() => fontColor = Color(0xFF9DA5A9)),
        onExit: (event) => setState(() => fontColor = Colors.white),
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: UIConstants.navbarFontWeight,
            color: fontColor,
          ),
        ),
      ),
      onTap: () {
        if (widget.homeController != null) {
          widget.homeController!.scrollToTop();
        }
      },
    );
  }
}
