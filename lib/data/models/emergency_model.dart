class EmergencyModel1 {
  String? sTATUS;
  List<DBDATA>? dBDATA;
  SESSION? sESSION;
  String? errorDescription;
  EmergencyModel1({this.sTATUS, this.dBDATA, this.sESSION});

  EmergencyModel1.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    if (json['STATUS'] != 'ERROR') {
      if (json['DB_DATA'] != null) {
        dBDATA = <DBDATA>[];
        json['DB_DATA'].forEach((v) {
          dBDATA!.add(DBDATA.fromJson(v));
        });
      }
      errorDescription = null;
    } else {
      errorDescription = json['ERROR_DESCRIPTION'];
      dBDATA = null;
    }
    sESSION =
        json['SESSION'] != null ? SESSION.fromJson(json['SESSION']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STATUS'] = sTATUS;
    if (dBDATA != null) {
      data['DB_DATA'] = dBDATA!.map((v) => v.toJson()).toList();
    }
    if (sESSION != null) {
      data['SESSION'] = sESSION!.toJson();
    }
    return data;
  }
}

class DBDATA {
  int? id;
  int? orgId;
  String? name;
  String? address;
  String? phone;
  String? type;
  String? status;
  int? entryTime;
  String? entryTimeFormated;

  DBDATA(
      {this.id,
      this.orgId,
      this.name,
      this.address,
      this.phone,
      this.type,
      this.status,
      this.entryTime,
      this.entryTimeFormated});

  DBDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orgId = json['org_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    type = json['type'];
    status = json['status'];
    entryTime = json['entry_time'];
    entryTimeFormated = json['entry_time_formated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['org_id'] = orgId;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['type'] = type;
    data['status'] = status;
    data['entry_time'] = entryTime;
    data['entry_time_formated'] = entryTimeFormated;
    return data;
  }
}

class SESSION {
  String? accountType;
  int? id;
  int? orgId;
  String? userName;
  String? orgAdmin;
  String? userEmail;
  int? userRole;
  String? status;
  int? entryTime;
  String? roleName;
  String? orgName;
  String? orgStatus;
  String? fullAccess;
  String? insertAccess;
  String? updateAccess;
  String? deleteAccess;
  int? iat;
  int? exp;
  String? iss;

  SESSION(
      {this.accountType,
      this.id,
      this.orgId,
      this.userName,
      this.orgAdmin,
      this.userEmail,
      this.userRole,
      this.status,
      this.entryTime,
      this.roleName,
      this.orgName,
      this.orgStatus,
      this.fullAccess,
      this.insertAccess,
      this.updateAccess,
      this.deleteAccess,
      this.iat,
      this.exp,
      this.iss});

  SESSION.fromJson(Map<String, dynamic> json) {
    accountType = json['account_type'];
    id = json['id'];
    orgId = json['org_id'];
    userName = json['user_name'];
    orgAdmin = json['org_admin'];
    userEmail = json['user_email'];
    userRole = json['user_role'];
    status = json['status'];
    entryTime = json['entry_time'];
    roleName = json['role_name'];
    orgName = json['org_name'];
    orgStatus = json['org_status'];
    fullAccess = json['full_access'];
    insertAccess = json['insert_access'];
    updateAccess = json['update_access'];
    deleteAccess = json['delete_access'];
    iat = json['iat'];
    exp = json['exp'];
    iss = json['iss'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_type'] = accountType;
    data['id'] = id;
    data['org_id'] = orgId;
    data['user_name'] = userName;
    data['org_admin'] = orgAdmin;
    data['user_email'] = userEmail;
    data['user_role'] = userRole;
    data['status'] = status;
    data['entry_time'] = entryTime;
    data['role_name'] = roleName;
    data['org_name'] = orgName;
    data['org_status'] = orgStatus;
    data['full_access'] = fullAccess;
    data['insert_access'] = insertAccess;
    data['update_access'] = updateAccess;
    data['delete_access'] = deleteAccess;
    data['iat'] = iat;
    data['exp'] = exp;
    data['iss'] = iss;
    return data;
  }
}
