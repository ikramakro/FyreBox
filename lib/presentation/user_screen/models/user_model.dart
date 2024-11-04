import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'actions_item_model.dart';

class UserModel {
  List<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 2,
      title: "All",
    ),
    SelectionPopupModel(
      id: 1,
      title: "Active",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "In-Active",
    ),
  ];
  List<SelectionPopupModel> roleDropdownItemList = [
    SelectionPopupModel(
      id: 2,
      title: "Admin",
    ),
    SelectionPopupModel(
      id: 1,
      title: "User",
      isSelected: true,
    ),
  ];
  List<ActionsItemModel> actionsItemList =
      List.generate(2, (index) => ActionsItemModel());
}
