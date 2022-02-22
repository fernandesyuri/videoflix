import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';

class CustomDropDownSelector extends StatefulWidget {
  final List<DropdownMenuItem<String>>? items;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final String? value;
  const CustomDropDownSelector(
      {Key? key, required this.items, this.onTap, this.onChanged, this.value})
      : super(key: key);

  @override
  _CustomDropDownSelectorState createState() =>
      _CustomDropDownSelectorState(this.value);
}

class _CustomDropDownSelectorState extends State<CustomDropDownSelector> {
  final GlobalKey dropdownKey = GlobalKey();
  String? selectedValue;

  _CustomDropDownSelectorState(this.selectedValue);

  @override
  Widget build(BuildContext context) {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, controller) {
        return SizedBox(
          width: 150.0,
          height: 50.0,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: openItemsList,
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: UIConstants.pageBackgroundColor,
                  filled: true,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    key: dropdownKey,
                    value: this.selectedValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    items: this.widget.items,
                    onTap: this.widget.onTap,
                    enableFeedback: true,
                    onChanged: (_newValue) {
                      setState(() {
                        this.selectedValue = _newValue;
                      });
                      this.widget.onChanged?.call(_newValue);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openItemsList() {
    GestureDetector? detector;
    void search(BuildContext context) {
      context.visitChildElements((element) {
        if (detector != null) return;
        if (element.widget is GestureDetector)
          detector = element.widget as GestureDetector?;
        else
          search(element);
      });
    }

    search(dropdownKey.currentContext!);
    if (detector != null) detector!.onTap!();
  }
}
