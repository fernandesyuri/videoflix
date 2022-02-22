import 'package:flutter/material.dart';

enum Classification { l, ten, twelve, fourteen, sixteen, eighteen }

// ignore: must_be_immutable
class ClassificationIcon extends StatelessWidget {
  final Classification classification;
  final double? size;
  late Color backgroundColor;
  late String text;
  Color borderColor = Colors.transparent;

  ClassificationIcon({
    Key? key,
    required this.classification,
    this.size,
  }) : super(key: key) {
    switch (classification) {
      case Classification.l:
        this.backgroundColor = Color.fromRGBO(0, 143, 25, 1);
        this.text = 'L';
        break;
      case Classification.ten:
        this.backgroundColor = Color.fromRGBO(0, 130, 221, 1);
        this.text = '10';
        break;
      case Classification.twelve:
        this.backgroundColor = Color.fromRGBO(253, 207, 23, 1);
        this.text = '12';
        break;
      case Classification.fourteen:
        this.backgroundColor = Color.fromRGBO(239, 135, 19, 1);
        this.text = '14';
        break;
      case Classification.sixteen:
        this.backgroundColor = Color.fromRGBO(207, 0, 13, 1);
        this.text = '16';
        break;
      case Classification.eighteen:
        this.backgroundColor = Color.fromRGBO(0, 0, 0, 1);
        this.text = '18';
        this.borderColor = Colors.white;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: this.borderColor),
      ),
      width: this.size ?? 30.0,
      height: this.size ?? 30.0,
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: (this.size ?? 30.0) / 2,
          ),
        ),
      ),
    );
  }
}
