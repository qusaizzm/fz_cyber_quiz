// import 'package:flutter/material.dart';
// import 'package:fz_cyber_quiz/ui/shared/constant.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

// class QuestionController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   // List<Question> _questions = sample_data
//   //     .map(
//   //       (question) => Question(
//   //           id: question['id'],
//   //           question: question['question'],
//   //           options: question['options'],
//   //           answer: question['answer_index']),
//   //     )
//   //     .toList();
//   // List<Question> get questions => this._questions;

//   bool? isAnswered;
//   // bool? get isAnswered => this._isAnswered;

//   int? correctAns;
//   // int? get correctAns => this._correctAns;

//   int? selectedAns;
//   // int? get selectedAns => this._selectedAns;

//   void checkAns(questionAnswer, int selectedIndex) {
//     // _isAnswered = true;
//     correctAns = questionAnswer;
//     selectedAns = selectedIndex;
//     print("_selectedAns $selectedAns");
//     print("_selectedAns $questionAnswer");
//     update();
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     isAnswered = false;
//   }
// }

// class Option extends StatelessWidget {
//   const Option({
//     Key? key,
//     required this.text,
//     required this.index,
//     required this.press,
//     required this.color,
//   }) : super(key: key);
//   final String text;
//   final int index;
//   final VoidCallback press;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QuestionController>(
//         init: QuestionController(),
//         builder: (qnController) {
//           // Color getTheRightColor() {
//           //   if (qnController.isAnswered == true) {
//           //     if (index == qnController.correctAns) {
//           //       return AppColor.correct;
//           //     } else if (index == qnController.selectedAns &&
//           //         qnController.selectedAns != qnController.correctAns) {
//           //       return AppColor.incorrect;
//           //     }
//           //   }
//           //   return AppColor.neutral;
//           // }

//           IconData getTheRightIcon() {
//             return color == AppColor.incorrect ? Icons.close : Icons.done;
//           }

//           return InkWell(
//             onTap: press,
//             child: Container(
//               margin: EdgeInsets.only(top: 10),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(color: color), // getTheRightColor()),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${index + 1}. $text",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   Container(
//                     height: 26,
//                     width: 26,
//                     decoration: BoxDecoration(
//                       color: color == AppColor.neutral
//                           ? Colors.transparent
//                           : color,
//                       borderRadius: BorderRadius.circular(50),
//                       border: Border.all(color: color), //getTheRightColor()),
//                     ),
//                     child: color ==
//                             AppColor
//                                 .neutral //getTheRightColor() == AppColor.neutral
//                         ? null
//                         : Icon(getTheRightIcon(), size: 16),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
