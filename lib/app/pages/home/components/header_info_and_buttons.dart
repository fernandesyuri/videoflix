import 'package:flutter/material.dart';
import 'package:videoflix/app/utils/constants.dart';

class HeaderInfoAndButtons extends StatelessWidget {
  const HeaderInfoAndButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(left: UIConstants.horizontalPadding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 500.0,
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
                ),
                SizedBox(height: 30.0),
                Text(
                  'Mussum Ipsum, cacilds vidis litro abertis. Casamentiss faiz malandris se pirulitá. Sapien in monti palavris qui num significa nadis i pareci latim. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. Quem num gosta di mim que vai caçá sua turmis!',
                ),
                SizedBox(height: 30.0),
                Row(children: [
                  ElevatedButton(
                    onPressed: () => print('pressed'),
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                        ),
                        Text('Play'),
                        SizedBox(width: 6.0),
                      ],
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
                        SizedBox(width: 4.0),
                        Text('More info'),
                        SizedBox(width: 6.0),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
