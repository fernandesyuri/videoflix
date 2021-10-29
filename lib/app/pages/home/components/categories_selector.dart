import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({Key? key}) : super(key: key);

  @override
  _CategoriesSelectorState createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  final GlobalKey dropdownKey = GlobalKey();

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
                    value: controller.selectedCategorie,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    items: controller.categorieOptions,
                    onTap: () => print('Clicou'),
                    enableFeedback: true,
                    onChanged: (_newValue) {
                      print('Mudou');
                      controller.changeSelectedCategorie(_newValue);
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
