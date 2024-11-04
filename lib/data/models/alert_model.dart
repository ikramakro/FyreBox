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

 
}

class DBDATA {
  int? id;
  int? deviceId;
  int? alertType;
  String? status;
  int? entryTime;
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
}
