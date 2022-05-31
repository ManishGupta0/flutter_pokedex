import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String type;
  final EdgeInsets? margin;
  final Color? color;
  final bool isSmall;
  final Function()? onTap;

  const TypeChip(
      {Key? key,
      required this.type,
      this.margin,
      this.color,
      this.onTap,
      this.isSmall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.red,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            border: Border.all(
              color: color ?? Colors.white,
              width: 1.5,
            ),
          ),
          child: Text(
            type.toUpperCase(),
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: isSmall ? 9 : null,
            ),
          ),
        ),
      ),
    );
  }
}
