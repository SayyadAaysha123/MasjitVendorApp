import 'package:masjit_vendor_app/model/jammat.dart';

class Ed {
  String? name;
  List<Jammat>? jammat;

  Ed({this.name, this.jammat});

  Ed.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['jammat'] != null) {
      jammat = <Jammat>[];
      json['jammat'].forEach((v) {
        jammat!.add(Jammat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (jammat != null) {
      data['jammat'] = jammat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
