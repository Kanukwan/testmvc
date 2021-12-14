class CatsAssets {
  String? title;
  String? subtitle;
  String? date;

  CatsAssets({this.title, this.subtitle, this.date});
  factory CatsAssets.fromJson(Map<String, dynamic> json) {
    return CatsAssets(
        title: json["title"], subtitle: json["subtitle"], date: json["date"]);
  }
}
