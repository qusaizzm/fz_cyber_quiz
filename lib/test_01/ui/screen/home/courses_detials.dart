import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/test_01/ui/shared/constant.dart';
import 'package:fz_cyber_quiz/test_01/ui/widgets/my_button.dart';

import 'quiz_screen.dart';

class CoursesDetails extends StatelessWidget {
  final courseName;
  const CoursesDetails({Key? key, this.courseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(courseName)),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              hSize(),
              hSize(),
              Text(
                "This assessment aims to evaluate your expertise in the realm of cybersecurity, gauging not only your knowledge but also your comprehension of this intricate field.",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              hSize(),
              hSize(),
              hSize(),
              Text(
                "Cybersecurity is a vital field aimed at safeguarding information systems and data from electronic threats and cyber attacks. In our current era, which heavily relies on technology and electronic communications, cybersecurity has become an indispensable necessity to ensure the safety and confidentiality of information and to maintain the sustainability of digital operations.",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 18.0,
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              MyButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizQsAns(quizName: courseName),
                      ),
                    );
                  },
                  text: "Start")
            ],
          ),
        ),
      ),
    );
  }
}

class CradCourses extends StatelessWidget {
  final txt;
  final onTap;

  const CradCourses({
    super.key,
    this.txt,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.001,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        txt,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Questions  - ",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "203",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
