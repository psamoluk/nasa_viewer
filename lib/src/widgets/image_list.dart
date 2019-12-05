import 'package:flutter/material.dart';

import '../models/nasa_pod_model.dart';
import '../widgets/image_card.dart';

class ImageList extends StatelessWidget {
  final List<NasaImageModel> images;
  ImageList(this.images);
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext cnxt, int index) {
        return new Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ImageCard(images[index]),
              ]
            ),
          ],
        );
      },
    );
  }
}
