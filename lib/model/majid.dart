class model {
  List<WeeklyNamaz>? weeklyNamaz;
  List<Trustee>? trustee;
  List<Ed>? ed;
  Location? location;
  List<String>? images;
  List<String>? notices;
  String? sahr;
  String? iftar;

  model(
      {this.weeklyNamaz,
      this.trustee,
      this.ed,
      this.location,
      this.images,
      this.notices,
      this.sahr,
      this.iftar});

  model.fromJson(Map<String, dynamic> json) {
    if (json['weekly_namaz'] != null) {
      weeklyNamaz = <WeeklyNamaz>[];
      json['weekly_namaz'].forEach((v) {
        weeklyNamaz!.add(WeeklyNamaz.fromJson(v));
      });
    }
    if (json['trustee'] != null) {
      trustee = <Trustee>[];
      json['trustee'].forEach((v) {
        trustee!.add(Trustee.fromJson(v));
      });
    }
    if (json['ed'] != null) {
      ed = <Ed>[];
      json['ed'].forEach((v) {
        ed!.add(Ed.fromJson(v));
      });
    }
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    images = json['images'].cast<String>();
    notices = json['notices'].cast<String>();
    sahr = json['sahr'];
    iftar = json['iftar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weeklyNamaz != null) {
      data['weekly_namaz'] = weeklyNamaz!.map((v) => v.toJson()).toList();
    }
    if (trustee != null) {
      data['trustee'] = trustee!.map((v) => v.toJson()).toList();
    }
    if (ed != null) {
      data['ed'] = ed!.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['images'] = images;
    data['notices'] = notices;
    data['sahr'] = sahr;
    data['iftar'] = iftar;
    return data;
  }
}

class WeeklyNamaz {
  String? day;
  String? azan;
  String? jammt;

  WeeklyNamaz({this.day, this.azan, this.jammt});

  WeeklyNamaz.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    azan = json['azan'];
    jammt = json['jammt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['day'] = day;
    data['azan'] = azan;
    data['jammt'] = jammt;
    return data;
  }
}

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    if (jammat != null) {
      data['jammat'] = jammat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = lat;
    data['long'] = long;
    data['place'] = place;
    return data;
  }
}
