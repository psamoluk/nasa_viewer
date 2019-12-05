import 'package:flutter/material.dart';
import '../models/nasa_pod_model.dart';

import '../widgets/detail_page.dart';

class BottomBar extends StatelessWidget {
  final NasaImageModel image;
  BottomBar(this.image);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('DETAILS'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(image)),
                        );
                      },
                    )
                  ],
                ),
              );
  }
}