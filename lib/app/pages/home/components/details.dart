import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/home/components/classification_icon.dart';
import 'package:videoflix/app/pages/home/components/drop_down_selector.dart';
import 'package:videoflix/app/pages/home/components/episode_card.dart';
import 'package:videoflix/app/pages/home/components/rounded_button.dart';
import 'package:videoflix/app/pages/home/home_controller.dart';
import 'package:videoflix/app/utils/constants.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ControlledWidgetBuilder<HomeController>(
      builder: (context, snapshot) {
        final HomeController _homeController =
            FlutterCleanArchitecture.getController<HomeController>(context);
        return Visibility(
          visible: _homeController.detailsPopupVisible,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.8),
              ),
              ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 5 * 3,
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 5,
                      right: MediaQuery.of(context).size.width / 5,
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.red,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 400.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                ),
                                child: Image.asset(
                                  'images/bleach.webp',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 402.0,
                              decoration: BoxDecoration(
                                color: UIConstants.pageBackgroundColor,
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    UIConstants.pageBackgroundColor
                                        .withOpacity(0.0),
                                    UIConstants.pageBackgroundColor,
                                  ],
                                  stops: [0.9, 1.0],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10.0,
                              right: 10.0,
                              child: CustomRoundedButton(
                                icon: Icon(
                                  Icons.close_outlined,
                                  color: Colors.white,
                                  size: 20.0,
                                  semanticLabel: 'Fechar',
                                ),
                                margin: EdgeInsets.zero,
                                borderColor: Colors.transparent,
                                backgroundColor:
                                    UIConstants.pageBackgroundColor,
                                onTap: () =>
                                    _homeController.setDetailsPopup(false),
                              ),
                              // GestureDetector(
                              //   onTap: () =>
                              //       _homeController.setDetailsPopup(false),
                              //   child: MouseRegion(
                              //     cursor: SystemMouseCursors.click,
                              //     child: Icon(
                              //       Icons.close_outlined,
                              //       color: Colors.white,
                              //       size: 30.0,
                              //       semanticLabel: 'Close',
                              //     ),
                              //   ),
                              // ),
                            ),
                            Positioned(
                              left: 30.0,
                              bottom: 40.0,
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => print('pressed'),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                        ),
                                        SizedBox(width: 6.0),
                                        Text('Reproduzir'),
                                        SizedBox(width: 6.0),
                                      ],
                                    ),
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          Size.fromHeight(40)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                      textStyle: MaterialStateProperty.all(
                                        TextStyle(fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  CustomRoundedButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: 10.0,
                                      right: 5.0,
                                    ),
                                    borderColor: Colors.white,
                                    backgroundColor:
                                        UIConstants.pageBackgroundColor,
                                  ),
                                  CustomRoundedButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    margin: EdgeInsets.zero,
                                    borderColor: Colors.white,
                                    backgroundColor:
                                        UIConstants.pageBackgroundColor,
                                  ),
                                  CustomRoundedButton(
                                    icon: Icon(
                                      Icons.thumb_down,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: 5.0,
                                    ),
                                    borderColor: Colors.white,
                                    backgroundColor:
                                        UIConstants.pageBackgroundColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          color: UIConstants.pageBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Row(
                                  children: [
                                    Container(
                                      width: constraints.maxWidth / 3 * 2,
                                      height: 100.0,
                                      // color: Colors.red,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('2022'),
                                              SizedBox(width: 10.0),
                                              ClassificationIcon(
                                                classification:
                                                    Classification.twelve,
                                                size: 30.0,
                                              ),
                                              SizedBox(width: 10.0),
                                              Text('4 temporadas'),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 20.0,
                                              top: 20.0,
                                            ),
                                            child: Text(
                                                'Mussum Ipsum, cacilds vidis litro abertis. Si num tem leite então bota uma pinga aí cumpadi!Detraxit consequat et quo num tendi nada.Quem manda na minha terra sou euzis!Admodum accumsan disputationi eu sit. Vide electram sadipscing et per.'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: constraints.maxWidth / 3,
                                      height: 100.0,
                                      // color: Colors.green,
                                      child: Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Elenco: ',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                TextSpan(
                                                  text:
                                                      'Mussum Ipsum, cacilds vidis litro abertis. Si num tem leite então bota uma pinga aí cumpadi!',
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20.0),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Gêneros: ',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                TextSpan(
                                                  text:
                                                      'Comédia, Terror, Ação, Suspense, Drama, Ficção',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: UIConstants.pageBackgroundColor,
                          padding: EdgeInsets.only(top: 30.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                            child: Column(
                              children: List.generate(
                                10,
                                (index) {
                                  if (index == 0) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Episódios',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            CustomDropDownSelector(
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text('Temporada 1'),
                                                  value: '1',
                                                ),
                                                DropdownMenuItem(
                                                  child: Text('Temporada 2'),
                                                  value: '2',
                                                ),
                                                DropdownMenuItem(
                                                  child: Text('Temporada 3'),
                                                  value: '3',
                                                ),
                                              ],
                                              value: '1',
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                        SizedBox(height: 20.0),
                                      ],
                                    );
                                  } else {
                                    return EpisodeCard(index);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
