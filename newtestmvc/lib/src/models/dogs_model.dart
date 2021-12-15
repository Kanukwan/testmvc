class DogsAssets {
  String? title;
  String? subtitle;

  DogsAssets({this.title, this.subtitle});
  factory DogsAssets.fromJson(Map<String, dynamic> json) {
    return DogsAssets(title: json["title"], subtitle: json["subtitle"]);
  }
}
