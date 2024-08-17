class UserDataModel {
  String? sTATUS;
  List<DBDATA>? dBDATA;
  String? errorDescription;
  UserDataModel({
    this.sTATUS,
    this.dBDATA,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
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
      dBDATA = null;
      errorDescription = json['ERROR_DESCRIPTION'];
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
  String? userName;
  String? orgAdmin;
  String? userEmail;
  String? userPassword;
  String? userRole;
  String? status;
  String? entryTime;
  String? roleName;
  String? orgName;
  String? entryTimeFormated;
  Permissions? permissions;

  DBDATA(
      {this.id,
      this.orgId,
      this.userName,
      this.orgAdmin,
      this.userEmail,
      this.userPassword,
      this.userRole,
      this.status,
      this.entryTime,
      this.roleName,
      this.orgName,
      this.entryTimeFormated,
      this.permissions});

  DBDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orgId = json['org_id'];
    userName = json['user_name'];
    orgAdmin = json['org_admin'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userRole = json['user_role'];
    status = json['status'];
    entryTime = json['entry_time'];
    roleName = json['role_name'];
    orgName = json['org_name'];
    entryTimeFormated = json['entry_time_formated'];
    permissions = json['permissions'] != null && json['permissions'] != ''
        ? Permissions.fromJson(json['permissions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['org_id'] = orgId;
    data['user_name'] = userName;
    data['org_admin'] = orgAdmin;
    data['user_email'] = userEmail;
    data['user_password'] = userPassword;
    data['user_role'] = userRole;
    data['status'] = status;
    data['entry_time'] = entryTime;
    data['role_name'] = roleName;
    data['org_name'] = orgName;
    data['entry_time_formated'] = entryTimeFormated;
    if (permissions != null) {
      data['permissions'] = permissions!.toJson();
    }
    return data;
  }
}

class Permissions {
  String? id;
  String? userId;
  String? fullAccess;
  String? insertAccess;
  String? updateAccess;
  String? deleteAccess;
  String? status;
  String? entryTime;

  Permissions(
      {this.id,
      this.userId,
      this.fullAccess,
      this.insertAccess,
      this.updateAccess,
      this.deleteAccess,
      this.status,
      this.entryTime});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fullAccess = json['full_access'];
    insertAccess = json['insert_access'];
    updateAccess = json['update_access'];
    deleteAccess = json['delete_access'];
    status = json['status'];
    entryTime = json['entry_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['full_access'] = fullAccess;
    data['insert_access'] = insertAccess;
    data['update_access'] = updateAccess;
    data['delete_access'] = deleteAccess;
    data['status'] = status;
    data['entry_time'] = entryTime;
    return data;
  }
}
