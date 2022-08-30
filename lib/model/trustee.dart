class Trustee {
  String? designation;
  String? name;
  String? contact;

  Trustee({this.designation, this.name, this.contact});

  Trustee.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
    name = json['name'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['designation'] = designation;
    data['name'] = name;
    data['contact'] = contact;
    return data;
  }
}
