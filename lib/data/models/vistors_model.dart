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

 
}

class DBDATA {
  int? id;
  int? orgId;
  String? visitorName;
  String? visitorSurname;
  String? visitorEmail;
  String? visitorPhone;
  String? status;
  int? entryTime;
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

}