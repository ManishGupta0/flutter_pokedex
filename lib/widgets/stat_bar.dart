import 'package:flutter/material.dart';

class StatBar2C extends StatelessWidget {
  const StatBar2C({
    Key? key,
    required this.lightColor,
    required this.typeColor,
    required this.statName,
    required this.statValue,
  }) : super(key: key);

  final Color lightColor;
  final Color typeColor;
  final String statName;
  final String statValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: lightColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: typeColor,
              child: Text(statName),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(statValue),
            ),
          ),
        ],
      ),
    );
  }
}

class StatBar1C extends StatelessWidget {
  final Color? color;
  final String text;
  final Function()? onTap;

  const StatBar1C({
    Key? key,
    this.color,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
