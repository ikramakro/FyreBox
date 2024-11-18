import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'actions_item_model.dart';

class DeviceModel {
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
  List<SelectionPopupModel> deviceTypeDropdownItemList = [
    SelectionPopupModel(
      id: 2,
      title: "IntegrationUnit",
    ),
    SelectionPopupModel(
      id: 2,
      title: "AdminUnit",
    ),
    SelectionPopupModel(
      id: 1,
      title: "FyrboxUnit",
      isSelected: true,
    ),
  ];

  List<SelectionPopupModel> orderdeviceTypeDropdownItemList = [
    SelectionPopupModel(
      id: 2,
      title: "Fyrebox Unit",
    ),
    SelectionPopupModel(
      id: 1,
      title: "Admin Unit",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 1,
      title: "Intefration Unit",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 1,
      title: "Multi Detector",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 1,
      title: "Repeat Speaker",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 1,
      title: "Fyrebox compact unit",
      isSelected: true,
    ),
  ];
  List<ActionsItemModel> actionsItemList =
      List.generate(2, (index) => ActionsItemModel());
}
