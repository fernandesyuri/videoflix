import 'package:flutter/material.dart';
import 'package:videoflix/app/utils/constants.dart';

class HeaderInfoAndButtons extends StatelessWidget {
  const HeaderInfoAndButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: UIConstants.horizontalPadding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 600.0,
            maxWidth: 800.0,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/deadlySins.webp',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 30.0),
                Text(
                  'Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Sapien in monti palavris qui num significa nadis i pareci latim. Vehicula non.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
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
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () => print('pressed 2'),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                          ),
                          SizedBox(width: 10.0),
                          Text('Mais informações'),
                          SizedBox(width: 6.0),
                        ],
                      ),
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(40)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(109, 109, 110, 0.7)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
