import 'package:flutter/material.dart';

class EpisodeCard extends StatefulWidget {
  final int episodeNumber;
  const EpisodeCard(this.episodeNumber, {Key? key}) : super(key: key);

  @override
  _EpisodeCardState createState() => _EpisodeCardState();
}

class _EpisodeCardState extends State<EpisodeCard> {
  bool showPlayButton = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          showPlayButton = true;
        });
      },
      onExit: (event) {
        setState(() {
          showPlayButton = false;
        });
      },
      child: GestureDetector(
        onTap: () => print('Clicou no episodio'),
        child: Container(
          decoration: BoxDecoration(
            border: BorderDirectional(
              top: BorderSide(
                width: 1.0,
                color: Colors.white24,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${this.widget.episodeNumber}'),
                SizedBox(width: 20.0),
                Container(
                  width: 150.0,
                  height: 84.37,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        child: Image.asset(
                          'images/bleach.webp',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Visibility(
                        visible: showPlayButton,
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    height: 84.37,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectableText('Título'),
                            Text('Duração'),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                            'Mussum Ipsum, cacilds vidis litro abertis. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo!Mé faiz elementum girarzis, nisi eros vermeio.Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.Posuere libero varius.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
