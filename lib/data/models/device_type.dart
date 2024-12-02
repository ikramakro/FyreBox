class DeviceTypeResponse {
  String? sTATUS;
  List<DBDATA>? dBDATA;
  String? errorDescription;

  DeviceTypeResponse({this.sTATUS, this.dBDATA, this.errorDescription});

  DeviceTypeResponse.fromJson(Map<String, dynamic> json) {
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
  String? deviceTypeName;
  String? deviceTypeLabel;
  String? deviceTypeDescription;
  String? status;
  int? entryTime;

  DBDATA(
      {this.id,
      this.deviceTypeName,
      this.deviceTypeLabel,
      this.deviceTypeDescription,
      this.status,
      this.entryTime});

  DBDATA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceTypeName = json['device_type_name'];
    deviceTypeLabel = json['device_type_label'];
    deviceTypeDescription = json['device_type_description'];
    status = json['status'];
    entryTime = json['entry_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['device_type_name'] = deviceTypeName;
    data['device_type_label'] = deviceTypeLabel;
    data['device_type_description'] = deviceTypeDescription;
    data['status'] = status;
    data['entry_time'] = entryTime;
    return data;
  }
}
