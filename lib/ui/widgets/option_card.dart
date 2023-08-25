import 'package:flutter/material.dart';

import '../shared/constant.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);
  final String option;
  final Color color;
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
          color: color == AppColor.correct ? Colors.white : Colors.grey,
        ),
        title: Text(
          option,
          style: TextStyle(
            fontSize: 18.0,
            // we will decide if the 'color' we are receiving here.
            // what ratio of the 'red' and 'green' colors are in it.
            // color: color.red != color.green ? Colors.yellow : Colors.black,
          ),
        ),
      ),
    );
  }
}
