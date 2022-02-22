import 'package:flutter/material.dart';

class CustomRoundedButton extends StatefulWidget {
  final Icon icon;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;

  const CustomRoundedButton({
    Key? key,
    required this.icon,
    required this.borderColor,
    required this.backgroundColor,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomRoundedButtonState createState() => _CustomRoundedButtonState();
}

class _CustomRoundedButtonState extends State<CustomRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: this.widget.onTap,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: this.widget.margin ??
                EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: this.widget.borderColor,
              ),
              color: this.widget.backgroundColor,
            ),
            child: this.widget.icon,
          ),
        ),
      ),
    );
  }
}
