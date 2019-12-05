import 'package:flutter/material.dart';

import '../models/nasa_pod_model.dart';
import '../widgets/detail_page_top.dart';
import '../widgets/detail_page_bottom.dart';

class DetailPage extends StatelessWidget {
  final NasaImageModel image;

  DetailPage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // topContent,
          DetailsTopContent(image),
          // bottomContent,
          DetailsBottomContent(image),
        ],
      ),
    );
  }
}
