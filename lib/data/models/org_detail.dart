class Organization {
  String? status;
  DBData? dbData;

  Organization({this.status, this.dbData});

  Organization.fromJson(Map<String, dynamic> json) {
    status = json['STATUS'];
    dbData = json['DB_DATA'] != null ? DBData.fromJson(json['DB_DATA']) : null;
  }
}

class DBData {
  String? id;
  String? orgName;
  String? orgEmail;
  String? orgPhone;
  String? type;
  String? orgVat;
  String? orgLogo;
  String? orgEvacuationMap;
  String? address;
  String? addedBy;
  String? status;
  String? entryTime;
  String? orgTypeName;
  String? entryTimeFormated;
  List<EvacuationMap>? evacuationMaps;
  List<Helpline>? helplines;

  DBData(
      {this.id,
      this.orgName,
      this.orgEmail,
      this.orgPhone,
      this.type,
      this.orgVat,
      this.orgLogo,
      this.orgEvacuationMap,
      this.address,
      this.addedBy,
      this.status,
      this.entryTime,
      this.orgTypeName,
      this.entryTimeFormated,
      this.evacuationMaps,
      this.helplines});

  DBData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orgName = json['org_name'];
    orgEmail = json['org_email'];
    orgPhone = json['org_phone'];
    type = json['type'];
    orgVat = json['org_vat'];
    orgLogo = json['org_logo'];
    orgEvacuationMap = json['org_evacuation_map'];
    address = json['address'];
    addedBy = json['added_by'];
    status = json['status'];
    entryTime = json['entry_time'];
    orgTypeName = json['org_type_name'];
    entryTimeFormated = json['entry_time_formated'];
    if (json['evacuation_maps'] != null) {
      evacuationMaps = [];
      json['evacuation_maps'].forEach((key, value) {
        evacuationMaps!.add(EvacuationMap.fromJson(value));
      });
    }
    if (json['helplines'] != null) {
      helplines = [];
      json['helplines'].forEach((key, value) {
        helplines!.add(Helpline.fromJson(value));
      });
    }
  }
}

class EvacuationMap {
  String? id;
  String? evacuationMap;

  EvacuationMap({this.id, this.evacuationMap});

  EvacuationMap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    evacuationMap = json['evacuation_map'];
  }
}

class Helpline {
  String? id;
  String? name;
  String? address;
  String? phone;
  String? type;

  Helpline({this.id, this.name, this.address, this.phone, this.type});

  Helpline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    type = json['type'];
  }
}
