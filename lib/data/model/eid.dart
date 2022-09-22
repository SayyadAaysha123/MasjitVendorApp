class Eid {
  String? name;
  List<String>? jammat;

  Eid({this.name, this.jammat});

  Eid.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    jammat = json['jammat'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['jammat'] = jammat;
    return data;
  }

  @override
  String toString() {
    return 'Eid{name: $name, jammat: $jammat}';
  }
}
