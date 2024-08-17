// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/actions_item_model.dart';

class ActionsItemWidget extends StatelessWidget {
  ActionsItemWidget(this.actionsItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(
          key: key,
        );
  ActionsItemModel actionsItemModelObj;
  Function(bool)? onSelectedChipView;
  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        actionsItemModelObj.button!,
        style: TextStyle(
          color: (actionsItemModelObj.isSelected ?? false)
              ? appTheme.black900.withOpacity(0.87)
              : appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: (actionsItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.blue500,
      shadowColor: appTheme.black900.withOpacity(0.2),
      elevation: 2,
      selectedColor: Colors.transparent,
      shape: (actionsItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.black900.withOpacity(0.87),
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                4.h,
              ))
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                4.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
