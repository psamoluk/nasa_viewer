import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http show get;
import 'dart:math';

import './widgets/image_list.dart';
import './widgets/navigation_bottom.dart';
import './models/nasa_pod_model.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}
class AppState extends State<App> {
  
  int counter = 0;
  var date = new DateTime.now();
  final navKey = GlobalKey<NavigatorState>();

  List<NasaImageModel> images = [];

  void clearList() {
    setState((){
      images.clear();
      date = new DateTime.now();
      fetchImage();
    });
  }
  void selectDate() {
      print('this will randomize date');
      Random _random = new Random();
      int yearMin = 2010;
      var rYear = yearMin + _random.nextInt(DateTime.now().year-2010);
      var rMonth = 1+_random.nextInt(12-0);
      var rDay = 1+_random.nextInt(28-0);
      date = new DateTime.utc(rYear, rMonth, rDay);
      fetchImage();

  }
  @override
  void initState() {
    fetchImage();
    super.initState();
  }
  //function to fetch image from api
  void fetchImage() async {

      //make api request to end point
      //https://jsonplaceholder.typicode.com/photos
      counter++;
      var dateNow = "${date.year}-${date.month}-${date.day}";

      date = new DateTime.utc(date.year, date.month, date.day-1);
      var url = 'https://api.nasa.gov/planetary/apod?api_key=9wZyNcaL1DBtukUD6pDaEMniySD76IwhPkWMWhOl&date=$dateNow';
  
      final response = await http.get(url);
      //var imageModel = new ImageModel.fromJson(json.decode(response.body));
      final imageModel = new NasaImageModel(json.decode(response.body));

      setState(() {
        images.insert(0, imageModel); // add(imageModel);
      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      home: Scaffold(
        appBar: AppBar(
          elevation: 8.0,
          title: Text("NASA Picture of the day"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.playlist_add),
              onPressed: fetchImage,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: (){
                clearList();
              }, // clearList,
            ),
          ],
        ),
      body: ImageList(images),
      bottomNavigationBar: 
        BottomNavigation(clearList, selectDate),
      ),
    );
  }
}