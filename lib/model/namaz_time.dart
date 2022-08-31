class NamazTime {
  String? day;
  String? azan;
  String? jammt;

  NamazTime({this.day, this.azan, this.jammt});

  NamazTime.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    azan = json['azan'];
    jammt = json['jammt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['azan'] = azan;
    data['jammt'] = jammt;
    return data;
  }
}
