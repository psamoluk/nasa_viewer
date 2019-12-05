import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/nasa_pod_model.dart';

class DetailsTopContent extends StatelessWidget {
  final NasaImageModel image;

  DetailsTopContent(this.image);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          margin: EdgeInsets.only(top: 24.0),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image.hdUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 24.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  image.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
