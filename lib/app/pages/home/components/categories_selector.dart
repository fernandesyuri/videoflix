import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({Key? key}) : super(key: key);

  @override
  _CategoriesSelectorState createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  @override
  Widget build(BuildContext context) {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, controller) {
        return DropdownButton<String>(
          value: controller.selectedCategorie,
          // icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          items: controller.categorieOptions,
          onTap: () => print('Tapou'),
          enableFeedback: true,
        );
      },
    );
  }
}

// class CategoriesSelector extends StatelessWidget {
//   const CategoriesSelector({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ControlledWidgetBuilder<HomeController>(
//       builder: (context, controller) {
//         return DropdownButton<String>(
//           // value: controller.selectedCategorie,
//           items: controller.categorieOptions,
//         );
//       },
//     );
//   }
// }
