import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/nasa_pod_model.dart';
import '../widgets/bottom_bar.dart';

class ImageCard extends StatelessWidget {
  final NasaImageModel image;

  ImageCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print('tapped');
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        image.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                      Text(image.date),
                    ]),
              ),
              image.mediaType == "image"
                  ? Center(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage, image: image.url),
                    )
                  : image.mediaType == "video" ? 
                  Text(
                      "${image.mediaType} media coming soon",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      
                    ) : Text("${image.mediaType} media type currently not supported"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    '${image.desc.substring(0, (image.desc.length ~/ 6))}...'),
              ),
              image.mediaType == "image" ? BottomBar(image) : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
