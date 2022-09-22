class WeeklyNamaz {
  String? day;
  String? azan;
  String? jammat;

  WeeklyNamaz({this.day, this.azan, this.jammat});

  WeeklyNamaz.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    azan = json['azan'];
    jammat = json['jammat'];
  }

  @override
  String toString() {
    return 'WeeklyNamaz{day: $day, azan: $azan, jammat: $jammat}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['azan'] = azan;
    data['jammat'] = jammat;
    return data;
  }
}
