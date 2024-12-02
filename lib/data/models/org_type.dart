class OrgType {
  String? sTATUS;
  List<DBDATA>? dBDATA;
  String? errorDescription;
  OrgType({this.sTATUS, this.dBDATA, this.errorDescription});

  OrgType.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    if (json['DB_DATA'] != null) {
      dBDATA = <DBDATA>[];
      json['DB_DATA'].forEach((v) {
        dBDATA!.add(DBDATA.fromJson(v));
      });
      errorDescription = null;
    } else {
      errorDescription = json['ERROR_DESCRIPTION'];
      dBDATA = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STATUS'] = sTATUS;
    if (dBDATA != null) {
      data['DB_DATA'] = dBDATA!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DBDATA {
  int? id;
  String? name;
  String? status;
  int? entryTime;

  DBDATA({this.id, this.name, this.status, this.entryTime});

  DBDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    entryTime = json['entry_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['entry_time'] = entryTime;
    return data;
  }
}
