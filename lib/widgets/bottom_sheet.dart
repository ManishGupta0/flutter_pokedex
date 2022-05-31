import 'package:flutter/material.dart';

void showDraggableBottomSheet(
  BuildContext context, {
  Widget? child,
  Color? color,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableBottomSheet(
      child: child,
      color: color ?? Colors.white,
    ),
  );
}

class DraggableBottomSheet extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const DraggableBottomSheet({Key? key, this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.4,
          maxChildSize: 1,
          builder: (_, ScrollController scrollController) => Container(
              // padding: const EdgeInsets.all(10.0),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              // child: ListView(
              //   shrinkWrap: true,
              //   controller: scrollController,
              //   children: [
              //     child!,
              //   ],
              // ),
              child: child!),
        ),
      ),
    );
  }
}
