import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:videoflix/app/utils/constants.dart';

class Carousel extends StatelessWidget {
  final int index;
  final int itemCount = 9;
  final CarouselController carouselController = CarouselController();

  Carousel(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: carouselController.previousPage,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 48.0,
              semanticLabel: 'Previous page',
            ),
          ),
        ),
        Expanded(
          child: CarouselSlider.builder(
            itemCount: this.itemCount,
            itemBuilder: (context, index, realIdx) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration:
                    BoxDecoration(color: UIConstants.pageBackgroundColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    'images/bleach.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: (9 / 1),
              viewportFraction: 0.2,
              enableInfiniteScroll: false,
              initialPage: 2,
              scrollDirection: Axis.horizontal,
              scrollPhysics: ClampingScrollPhysics(),
              onPageChanged: (int pageIndex, CarouselPageChangedReason reason) {
                if (pageIndex < 2) {
                  this.carouselController.animateToPage(2,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease);
                } else if (pageIndex > this.itemCount - 3) {
                  this.carouselController.animateToPage(this.itemCount - 3,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease);
                }
                print('$pageIndex - $reason');
                return true;
              },
              // onScrolled: (double? seila) {
              //   print('seila');
              //   print(seila);
              //   return;
              // },
              autoPlay: false,
            ),
            carouselController: carouselController,
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: carouselController.nextPage,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 48.0,
              semanticLabel: 'Next page',
            ),
          ),
        ),
      ],
    );
  }
}
