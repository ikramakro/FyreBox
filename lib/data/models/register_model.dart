class RegisterModel {
  String? sTATUS;
  String? eRRORFILTER;
  String? cLIENTID;
  String? cLIENTEMAIL;
  String? dESCRIPTION;

  RegisterModel(
      {this.sTATUS,
      this.eRRORFILTER,
      this.cLIENTID,
      this.cLIENTEMAIL,
      this.dESCRIPTION});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    eRRORFILTER = json['ERROR_FILTER'];
    cLIENTID = json['CLIENT_ID'];
    cLIENTEMAIL = json['CLIENT_EMAIL'];
    dESCRIPTION = json['DESCRIPTION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUS'] = this.sTATUS;
    data['ERROR_FILTER'] = this.eRRORFILTER;
    data['CLIENT_ID'] = this.cLIENTID;
    data['CLIENT_EMAIL'] = this.cLIENTEMAIL;
    data['DESCRIPTION'] = this.dESCRIPTION;
    return data;
  }
}
