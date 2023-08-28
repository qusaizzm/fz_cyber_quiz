import 'package:flutter/material.dart';

import '../shared/constant.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(
      {Key? key,
      required this.option,
      required this.color,
      required this.errColor})
      : super(key: key);
  final String option;
  final Color color;
  final Color errColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: color == AppColor.correct ? AppColor.correct : Colors.white38,
        border: Border.all(color: color, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        leading: Icon(
          Icons.check_circle_outline,
          color: color == AppColor.incorrect
              ? AppColor.incorrect
              : AppColor.byDarkpripmaryColor,
        ),
        title: Text(
          option,
          style: TextStyle(
            fontSize: 18.0,
            // color: errColor
            // we will decide if the 'color' we are receiving here.
            // what ratio of the 'red' and 'green' colors are in it.
            // color: color.red != color.green ? Colors.yellow : Colors.black,
          ),
        ),
      ),
    );
  }
}
