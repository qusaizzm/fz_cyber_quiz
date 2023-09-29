import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/domain/models/counts_model.dart';
import 'package:fz_cyber_quiz/domain/models/db_connect.dart';
import 'package:fz_cyber_quiz/ui/shared/sharedPre.dart';

import '../../shared/constant.dart';
import '../../widgets/my_button.dart';
import 'quiz_screen.dart';

class CoursesDetails extends StatefulWidget {
  final courseName;
  const CoursesDetails({Key? key, this.courseName}) : super(key: key);

  @override
  State<CoursesDetails> createState() => _CoursesDetailsState();
}

class _CoursesDetailsState extends State<CoursesDetails> {
  var db = DBconnect();

  late Future _questions;
  // Loading counter value on start

  Future<List<Counts>> getData() async {
    return db.fetchCounts(widget.courseName);
  }

  @override
  void initState() {
    _questions = getData();

    super.initState();
  }

  var selected;
  var theKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyButton(
        color: selected == null ? Colors.grey : null,
        onTap: () {
          var key = "${widget.courseName}" "$selected";
          setState(() {
            theKey = key;
          });
          // var li = [0, 1, 2, 3];
          // for (var i = 0; i < li.length; i++) {
          //   // print("value ${li[i]}");
          //   var ddadad = "${widget.courseName}" "${li[i]}";
          //   // print("sssdcx $ddadad");

          //   Helper.getPreData(ddadad).then((value) {
          //     if (value == null) {
          //       print("completeddsde ${ddadad} :: $value");
          //     } else {
          //       completed = value;
          //       print("not $completed");
          //     }
          //   });
          // }

          selected == null
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(
                        child: Text('Please Select Questions Number First')),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizQsAns(
                      quizName: theKey,
                    ),
                  ),
                );
        },
        text: "Select",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Center(child: Text(widget.courseName)),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _questions as Future<List<Counts>>,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                var extractedData = snapshot.data as List<Counts>;
                if (extractedData.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Choose the number of questions :",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            itemCount: extractedData.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => setState(() {
                                  selected = index;
                                  print("theKey $theKey");
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: selected == index
                                          ? Colors.greenAccent
                                          : Colors.white60,
                                      borderRadius: BorderRadius.circular(9),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${extractedData[index].title}"),
                                      // Text("${extractedData[index].complete}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                } else
                  return Container(
                    child: Center(
                      child: Text('No Data'),
                    ),
                  );
              }
            }
            // Loding
            else {
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
        ),
      ),
    );
  }

  Column Detials(BuildContext context) {
    return Column(
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
                  builder: (context) => QuizQsAns(quizName: widget.courseName),
                ),
              );
            },
            text: "Start")
      ],
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
                      "Countss  - ",
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
