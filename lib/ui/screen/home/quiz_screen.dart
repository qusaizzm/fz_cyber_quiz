import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../domain/firebaseauth_methods.dart';
import '../../../domain/models/db_connect.dart';
import '../../../domain/models/question_model.dart';
import '../../shared/constant.dart';
import '../../widgets/my_button.dart';
import '../../widgets/option_card.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/result_box.dart';

class QuizQsAns extends StatefulWidget {
  final quizName;
  const QuizQsAns({Key? key, this.quizName}) : super(key: key);

  @override
  _QuizQsAnsState createState() => _QuizQsAnsState();
}

class _QuizQsAnsState extends State<QuizQsAns> {
  var db = DBconnect();

  late Future _questions;
  // bool _isDB_Connected = false;
  FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();

  Future<List<Question>> getData() async {
    return db.fetchQuestions(widget.quizName);
  }

  @override
  void initState() {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // print(connectivityResult);
    // if (connectivityResult == ConnectivityResult.wifi||
    //     connectivityResult == ConnectivityResult.mobile) {
    //   _isDB_Connected = true;
    // } else {
    //   _isDB_Connected = false;
    // }
    _questions = getData();
    super.initState();
  }

  // create an index to loop through _questions
  int index = 0;
  // create a score variable
  int score = 0;
  // create a boolean value to check if the user has clicked
  bool isPressed = false;
  // create a function to display the next question
  bool isAlreadySelected = false;
  int? selectedIndex;
  bool isCerrectAnswer = false;
  int? isCerrectAnswerValue;

  Color isErrColore = const Color.fromARGB(255, 196, 88, 81);
  void nextQuestion(int questionLength) {
    selectedIndex = 9;
    if (index == questionLength - 1) {
      // this is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible:
              false, // this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score, // total points the user got
                questionLength: questionLength, // out of how many questions
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // when the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  // create a function for changing color
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  // create a function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  Color getTheRightColor(index) {
    if (isPressed) {
      if (index == isCerrectAnswerValue) {
        print("cccccccccccccccccccccccccccccccc");
        return AppColor.correct;
      } else if (index == selectedIndex &&
          selectedIndex != isCerrectAnswerValue) {
        return AppColor.incorrect;
      }
    }
    return AppColor.neutral;
  }

  @override
  Widget build(BuildContext context) {
    // use the FutureBuilder Widget

    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            if (extractedData.isNotEmpty) {
              var ops = extractedData[index].options;
              print("ops.length" + ops.length.toString());
              print("ops.extractedData" + extractedData.toString());
              for (int i = 0; i < ops.length; i++) {
                if (ops.values.toList()[i] == true) {
                  isCerrectAnswerValue = i;
                }
              }
              return Scaffold(
                body: SafeArea(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        // Container(
                        //   height: 50,
                        //   width: double.infinity,
                        //   // height: bottomBannerAd.size.height.toDouble(),
                        //   // width: bottomBannerAd.size.width.toDouble(),
                        //   child: BannerAD(),
                        // ),
                        hSize(),
                        hSize(),
                        QuestionWidget(
                          indexAction: index,
                          score: score.toString(),
                          totalQuestions: extractedData.length,
                        ),
                        const Divider(),
                        // add some space
                        const SizedBox(height: 25.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${extractedData[index].title} :',
                            style: const TextStyle(
                              fontSize: 24.0,
                              // color: neutral,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        for (int i = 0; i < ops.length; i++)
                          GestureDetector(
                            onTap: () {
                              if (isPressed == false) {
                                selectedIndex = i;

                                checkAnswerAndUpdate(ops.values.toList()[i]);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Center(child: Text('Click Naxt')),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 20),
                                ));
                              }
                            },
                            child: OptionCard(
                              option: ops.keys.toList()[i],
                              color: getTheRightColor(i),
                              errColor: isErrColore,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: MyButton(
                  onTap: () {
                    isPressed
                        ? nextQuestion(extractedData.length)
                        : Fluttertoast.showToast(
                            msg: "Please Select answer",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            fontSize: 14.0);
                  },
                  text: "Next",
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              );
            } else
              return Scaffold(
                body: Container(
                  child: Center(
                    child: Text('No Data'),
                  ),
                ),
              );
          }
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20.0),
                  Text(
                    'Internt Poor',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                    ),
                  ),
                  hSize(),
                  hSize(),
                  Text(
                    'loading..',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}

// import this file to our main.dart file
