class AlertResponse {
  String? sTATUS;
  List<DBDATA>? dBDATA;

  String? errorDescription;
  AlertResponse({this.sTATUS, this.dBDATA, this.errorDescription});

  AlertResponse.fromJson(Map<String, dynamic> json) {
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
  String? deviceId;
  String? alertType;
  String? status;
  String? entryTime;
  String? alertName;
  String? alertColor;
  String? alertDescription;
  String? orgName;
  String? deviceKey;
  String? entryTimeFormated;

  DBDATA(
      {this.id,
      this.deviceId,
      this.alertType,
      this.status,
      this.entryTime,
      this.alertName,
      this.alertColor,
      this.alertDescription,
      this.orgName,
      this.deviceKey,
      this.entryTimeFormated});

  DBDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    alertType = json['alert_type'];
    status = json['status'];
    entryTime = json['entry_time'];
    alertName = json['alert_name'];
    alertColor = json['alert_color'];
    alertDescription = json['alert_description'];
    orgName = json['org_name'];
    deviceKey = json['device_key'];
    entryTimeFormated = json['entry_time_formated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['device_id'] = deviceId;
    data['alert_type'] = alertType;
    data['status'] = status;
    data['entry_time'] = entryTime;
    data['alert_name'] = alertName;
    data['alert_color'] = alertColor;
    data['alert_description'] = alertDescription;
    data['org_name'] = orgName;
    data['device_key'] = deviceKey;
    data['entry_time_formated'] = entryTimeFormated;
    return data;
  }
}
