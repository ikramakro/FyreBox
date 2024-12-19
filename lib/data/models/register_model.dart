class RegisterModel {
  String? sTATUS;
  String? eRRORFILTER;
  String? cLIENTID;
  String? cLIENTEMAIL;
  String? dESCRIPTION;
  String? eRRORDESCRIPTION;

  RegisterModel({
    this.sTATUS,
    this.eRRORFILTER,
    this.cLIENTID,
    this.cLIENTEMAIL,
    this.dESCRIPTION,
    this.eRRORDESCRIPTION,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    eRRORFILTER = json['ERROR_FILTER'];
    cLIENTID = json['CLIENT_ID'];
    cLIENTEMAIL = json['CLIENT_EMAIL'];
    dESCRIPTION = json['DESCRIPTION'];

    eRRORDESCRIPTION = json['ERROR_DESCRIPTION'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['STATUS'] = sTATUS;
    data['ERROR_FILTER'] = eRRORFILTER;
    data['CLIENT_ID'] = cLIENTID;
    data['CLIENT_EMAIL'] = cLIENTEMAIL;
    data['DESCRIPTION'] = dESCRIPTION;
    return data;
  }
}
