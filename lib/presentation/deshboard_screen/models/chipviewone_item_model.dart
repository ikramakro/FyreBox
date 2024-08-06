class ChipviewoneItemModel {
  ChipviewoneItemModel({this.one, this.isSelected}) {
    one = one ?? "1k";
    isSelected = isSelected ?? false;
  }
  String? one;
  bool? isSelected;
}
