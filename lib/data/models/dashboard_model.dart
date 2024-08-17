class DashboardModel {
  String? sTATUS;
  DBDATA? dBDATA;
  SESSION? sESSION;
  String? errorDescription;
  DashboardModel({this.sTATUS, this.dBDATA, this.sESSION});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    if (json['STATUS'] != 'ERROR') {
      dBDATA =
          json['DB_DATA'] != null ? DBDATA.fromJson(json['DB_DATA']) : null;
      sESSION =
          json['SESSION'] != null ? SESSION.fromJson(json['SESSION']) : null;
    } else {
      sESSION = null;
      dBDATA = null;
      errorDescription = json['ERROR_DESCRIPTION'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STATUS'] = sTATUS;
    if (dBDATA != null) {
      data['DB_DATA'] = dBDATA!.toJson();
    }
    if (sESSION != null) {
      data['SESSION'] = sESSION!.toJson();
    }
    return data;
  }
}

class DBDATA {
  String? totalMyDevices;
  String? totalMyAlerts;
  String? totalMyVisitors;
  String? totalMyDueInvoices;

  DBDATA(
      {this.totalMyDevices,
      this.totalMyAlerts,
      this.totalMyVisitors,
      this.totalMyDueInvoices});

  DBDATA.fromJson(Map<String, dynamic> json) {
    totalMyDevices = json['total_my_devices'];
    totalMyAlerts = json['total_my_alerts'];
    totalMyVisitors = json['total_my_visitors'];
    totalMyDueInvoices = json['total_my_due_invoices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_my_devices'] = totalMyDevices;
    data['total_my_alerts'] = totalMyAlerts;
    data['total_my_visitors'] = totalMyVisitors;
    data['total_my_due_invoices'] = totalMyDueInvoices;
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
