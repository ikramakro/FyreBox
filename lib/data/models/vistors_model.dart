class VistorResponse {
  String? sTATUS;
  List<DBDATA>? dBDATA;
  
  String? eRRORDESCRIPTION;

  VistorResponse({this.sTATUS, this.dBDATA, this.eRRORDESCRIPTION});

  VistorResponse.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
     if (json['STATUS'] != 'ERROR') {
    if (json['DB_DATA'] != null) {
      dBDATA = <DBDATA>[];
      json['DB_DATA'].forEach((v) {
        dBDATA!.add(DBDATA.fromJson(v));
      });
      eRRORDESCRIPTION=null;
    }}else{
dBDATA = null;
      eRRORDESCRIPTION = json['ERROR_DESCRIPTION'];
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
  String? id;
  String? orgId;
  String? visitorName;
  String? visitorSurname;
  String? visitorEmail;
  String? visitorPhone;
  String? status;
  String? entryTime;
  String? orgName;
  String? entryTimeFormated;

  DBDATA(
      {this.id,
      this.orgId,
      this.visitorName,
      this.visitorSurname,
      this.visitorEmail,
      this.visitorPhone,
      this.status,
      this.entryTime,
      this.orgName,
      this.entryTimeFormated});

  DBDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orgId = json['org_id'];
    visitorName = json['visitor_name'];
    visitorSurname = json['visitor_surname'];
    visitorEmail = json['visitor_email'];
    visitorPhone = json['visitor_phone'];
    status = json['status'];
    entryTime = json['entry_time'];
    orgName = json['org_name'];
    entryTimeFormated = json['entry_time_formated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['org_id'] = orgId;
    data['visitor_name'] = visitorName;
    data['visitor_surname'] = visitorSurname;
    data['visitor_email'] = visitorEmail;
    data['visitor_phone'] = visitorPhone;
    data['status'] = status;
    data['entry_time'] = entryTime;
    data['org_name'] = orgName;
    data['entry_time_formated'] = entryTimeFormated;
    return data;
  }
}

class SESSION {
  String? accountType;
  String? id;
  String? orgId;
  String? userName;
  String? orgAdmin;
  String? userEmail;
  String? userRole;
  String? status;
  String? entryTime;
  String? roleName;
  String? orgName;
  String? orgStatus;
  String? fullAccess;
  String? insertAccess;
  String? updateAccess;
  String? deleteAccess;

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
      this.deleteAccess});

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
    return data;
  }
}