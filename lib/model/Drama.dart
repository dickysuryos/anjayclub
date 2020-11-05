class Drama {
  final String title;
  final String image;
  final String urlVideo;

  Drama({this.title,this.image,this.urlVideo});
  factory Drama.fromJson(Map<String,dynamic> json){
    return Drama(
      title: json['title'],
      image: json['image'],
      urlVideo : json['url']
    );
  }
}
