class Jammat {
  String? name;
  String? time;

  Jammat({this.name, this.time});

  Jammat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['time'] = time;
    return data;
  }
}
