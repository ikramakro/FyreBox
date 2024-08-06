class BaseModel {
  String? sTATUS;
  String? eRRORDESCRIPTION;
  String? dESCRIPTION;

  BaseModel({this.sTATUS, this.eRRORDESCRIPTION, this.dESCRIPTION});

  BaseModel.fromJson(Map<String, dynamic> json) {
    sTATUS = json['STATUS'];
    eRRORDESCRIPTION = json['ERROR_DESCRIPTION'];
    dESCRIPTION = json['DESCRIPTION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['STATUS'] = sTATUS;
    data['ERROR_DESCRIPTION'] = eRRORDESCRIPTION;
    data['DESCRIPTION'] = dESCRIPTION;
    return data;
  }
}
