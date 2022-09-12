class Jumma {
  String? azan;
  List<String>? jammat;

  Jumma({this.azan, this.jammat});

  Jumma.fromJson(Map<String, dynamic> json) {
    azan = json['azan'];
    jammat = json['jammat'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['azan'] = azan;
    data['jammat'] = jammat;
    return data;
  }
}
