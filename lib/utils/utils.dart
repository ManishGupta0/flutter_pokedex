import 'package:flutter/material.dart';

Widget verticalSpace({double? height}) {
  return SizedBox(
    height: height ?? 8.0,
  );
}

Widget horizontalSpace(double? width) {
  return SizedBox(
    width: width ?? 8.0,
  );
}
