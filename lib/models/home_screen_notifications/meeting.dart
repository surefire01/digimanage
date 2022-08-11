class Meeting {
  String time ="";
  String date ="";
  String title ="";
  String venue ="";


  Map<String,String> toJson(){
    return {
      "title" : title,
      "date" : date,
      "time" : time,
      "venue":venue
    } ;
  }

  void fromJson (Map mp){
    date = mp["date"];
    time = mp["time"];
    title = mp["title"];
    venue = mp["venue"];
  }



}