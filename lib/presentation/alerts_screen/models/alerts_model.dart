import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'actions_item_model.dart';

class AlertsModel {
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
    SelectionPopupModel(
      id: 3,
      title: "Archive",
    ),
  ];
  List<SelectionPopupModel> deviceTypeDropdownItemList = [
    SelectionPopupModel(
      id: 2,
      title: "Admin",
    ),
    SelectionPopupModel(
      id: 1,
      title: "Artisan",
      isSelected: true,
    ),
  ];
  List<ActionsItemModel> actionsItemList =
      List.generate(2, (index) => ActionsItemModel());
}
