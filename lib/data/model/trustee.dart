class Trustee {
  String? name;
  String? contact;
  String? designation;

  Trustee({this.name, this.contact, this.designation});

  Trustee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    contact = json['contact'];
    designation = json['designation'];
  }

  @override
  String toString() {
    return 'Trustee{name: $name, contact: $contact, designation: $designation}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['contact'] = contact;
    data['designation'] = designation;
    return data;
  }
}
