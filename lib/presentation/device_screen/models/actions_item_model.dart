class ActionsItemModel {
  ActionsItemModel({this.button, this.isSelected}) {
    button = button ?? "Action";
    isSelected = isSelected ?? false;
  }
  String? button;
  bool? isSelected;
}
