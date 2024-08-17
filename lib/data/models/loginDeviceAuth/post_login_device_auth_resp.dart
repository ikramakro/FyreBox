class PostLoginDeviceAuthResp {
  String? sTATUS;
  String? dESCRIPTION;
  USERDATA? uSERDATA;
  String? errorDescription;

  PostLoginDeviceAuthResp(
      {this.sTATUS, this.dESCRIPTION, this.uSERDATA, this.errorDescription});

  PostLoginDeviceAuthResp.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    dESCRIPTION = json['DESCRIPTION'];
    if (json['STATUS'] != 'ERROR') {
      uSERDATA = json['USER_DATA'] != null
          ? USERDATA.fromJson(json['USER_DATA'])
          : null;
      errorDescription = null;
    } else {
      uSERDATA = null;
      errorDescription = json['ERROR_DESCRIPTION'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUS'] = sTATUS;
    data['DESCRIPTION'] = dESCRIPTION;
    if (uSERDATA != null) {
      data['USER_DATA'] = uSERDATA!.toJson();
    }
    return data;
  }
}

class USERDATA {
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

  USERDATA(
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

  USERDATA.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
