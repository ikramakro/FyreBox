class DeviceResponse {
  String? status;
  List<DBData>? dbData;
  String? errorDescription;
  DeviceResponse({this.status, this.dbData, this.errorDescription});

  DeviceResponse.fromJson(Map<String, dynamic> json) {
    status = json['STATUS'];
    if (json['STATUS'] != 'ERROR') {
      if (json['DB_DATA'] != null) {
        dbData = <DBData>[];
        json['DB_DATA'].forEach((v) {
          dbData!.add(DBData.fromJson(v));
        });
      }
      errorDescription = null;
    } else {
      errorDescription = json['ERROR_DESCRIPTION'];
      dbData = null;
    }
  }
}

class DBData {
	int? id;
	int? orgId;
	String? deviceKey;
	int? deviceType;
	String? deviceName;
	String? deviceCiteName;
	String? deviceLocation;
	String? mfrName;
	String? mfrContact;
	String? mfrEmail;
	int? mfrDate;
	String? mfrSerialNo;
	String? status;
	int? entryTime;
	String? orgName;
	String? deviceTypeName;
	String? entryTimeFormated;
	Checklist? checklist;

	DBData({this.id, this.orgId, this.deviceKey, this.deviceType, this.deviceName, this.deviceCiteName, this.deviceLocation, this.mfrName, this.mfrContact, this.mfrEmail, this.mfrDate, this.mfrSerialNo, this.status, this.entryTime, this.orgName, this.deviceTypeName, this.entryTimeFormated, this.checklist});

	DBData.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		orgId = json['org_id'];
		deviceKey = json['device_key'];
		deviceType = json['device_type'];
		deviceName = json['device_name'];
		deviceCiteName = json['device_cite_name'];
		deviceLocation = json['device_location'];
		mfrName = json['mfr_name'];
		mfrContact = json['mfr_contact'];
		mfrEmail = json['mfr_email'];
		mfrDate = json['mfr_date'];
		mfrSerialNo = json['mfr_serial_no'];
		status = json['status'];
		entryTime = json['entry_time'];
		orgName = json['org_name'];
		deviceTypeName = json['device_type_name'];
		entryTimeFormated = json['entry_time_formated'];
		checklist = json['checklist'] != null&& json['checklist'] != '' ? new Checklist.fromJson(json['checklist']) : null;
	}

}
class Checklist {
	int? id;
	int? deviceId;
	String? siren;
	String? switcch;
	int? voltIndicator;
	String? ledWhite;
	String? ledRed;
	String? activationSms;
	String? signage;
	String? autoTest;
	String? testSms;
	String? power;
	int? voltLevel;
	int? battExpiry;
	int? deviInstall;
	String? boxState;
	int? diagUpdate;
	String? deviObstacle;
	int? lastUpdate;
	String? deviClean;
	String? deviCondition;
	String? status;
	int? entryTime;

	Checklist({this.id, this.deviceId, this.siren, this.switcch, this.voltIndicator, this.ledWhite, this.ledRed, this.activationSms, this.signage, this.autoTest, this.testSms, this.power, this.voltLevel, this.battExpiry, this.deviInstall, this.boxState, this.diagUpdate, this.deviObstacle, this.lastUpdate, this.deviClean, this.deviCondition, this.status, this.entryTime});

	Checklist.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		deviceId = json['device_id'];
		siren = json['siren'];
		switcch = json['switch'];
		voltIndicator = json['volt_indicator'];
		ledWhite = json['led_white'];
		ledRed = json['led_red'];
		activationSms = json['activation_sms'];
		signage = json['signage'];
		autoTest = json['auto_test'];
		testSms = json['test_sms'];
		power = json['power'];
		voltLevel = json['volt_level'];
		battExpiry = json['batt_expiry'];
		deviInstall = json['devi_install'];
		boxState = json['box_state'];
		diagUpdate = json['diag_update'];
		deviObstacle = json['devi_obstacle'];
		lastUpdate = json['last_update'];
		deviClean = json['devi_clean'];
		deviCondition = json['devi_condition'];
		status = json['status'];
		entryTime = json['entry_time'];
	}}
