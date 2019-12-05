class NasaImageModel {

  String url;
  String desc;
  String hdUrl;
  String title;
  String date;
  String copyright;
  String mediaType;
  String serviceVersion;

  NasaImageModel(Map<String, dynamic> parsedJson){
    url = parsedJson['url'];
    desc = parsedJson['explanation'];
    hdUrl = parsedJson['hdurl'];
    title = parsedJson['title'];
    date = parsedJson['date'];
    copyright = parsedJson['copyright'];
    mediaType = parsedJson['media_type'];
    serviceVersion = parsedJson['service_version'];
  }
}