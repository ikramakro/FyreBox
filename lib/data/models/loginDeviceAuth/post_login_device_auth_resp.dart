class AuthResponse {
  String? status;
  String? jwt;
  String? description;
  USERDATA? userData;
  String? errorDescription;

  AuthResponse(
      {this.status,
      this.jwt,
      this.description,
      this.userData,
      this.errorDescription});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['STATUS'];
    jwt =
        json['JWT']; // Only present in one class, included here for flexibility
    description = json['DESCRIPTION'];
    if (json['STATUS'] != 'ERROR') {
      userData = json['USER_DATA'] != null
          ? USERDATA.fromJson(json['USER_DATA'])
          : null;
      errorDescription = null;
    } else {
      userData = null;
      errorDescription = json['ERROR_DESCRIPTION'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STATUS'] = status;
    data['JWT'] = jwt;
    data['DESCRIPTION'] = description;
    if (userData != null) {
      data['USER_DATA'] = userData!.toJson();
    }
    if (errorDescription != null) {
      data['ERROR_DESCRIPTION'] = errorDescription;
    }
    return data;
  }
}

class USERDATA {
  String? accountType;
  dynamic id;
  dynamic orgId;
  String? userName;
  String? orgAdmin;
  String? userEmail;
  dynamic userRole;
  String? status;
  dynamic entryTime;
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
