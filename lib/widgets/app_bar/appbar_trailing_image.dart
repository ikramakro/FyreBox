// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarTrailingImage extends StatelessWidget {
  AppbarTrailingImage({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );
  String? imagePath;
  EdgeInsetsGeometry? margin;
  Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        16.h,
      ),
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath!,
          height: 32.h,
          width: 32.h,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            16.h,
          ),
        ),
      ),
    );
  }
}
