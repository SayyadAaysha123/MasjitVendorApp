class Location {
  String? lat;
  String? long;
  String? place;

  Location({this.lat, this.long, this.place});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    place = json['place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['place'] = place;
    return data;
  }
}
