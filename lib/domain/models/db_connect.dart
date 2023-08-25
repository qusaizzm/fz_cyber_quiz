import 'package:http/http.dart' as http; // the http package
import './question_model.dart';
import 'dart:convert';

class DBconnect {
  // let's first create  a function to add a question to our database.
// declare the name of the table you want to create and add .json as suffix

  // fetch the data from database
  Future<List<Question>> fetchQuestions(quizName) async {
    // we got the data from just using this. now let's print it to see what we got.
    var path = 'https://quiz-c6d98-default-rtdb.firebaseio.com/$quizName.json';
    // print(path);
    final url = Uri.parse(path);

    return http.get(url).then((response) {
      var data = json.decode(response.body);

      List<Question> newQuestions = [];
      for (var i = 0; i < data.length; i++) {
        var newQuestion = Question(
          id: data[i]
              .toString(), // the encrypted key/the title we gave to our data
          title: data[i]['question'].toString(), // title of the question
          options: Map.castFrom(data[i]['ops']), // options of the question
        );
        // add to newQuestions
        newQuestions.add(newQuestion);
        // print(data[i]['question'].toString());
      }
      // data.forEach((key, value) {
      //   var newQuestion = Question(
      //     id: key, // the encrypted key/the title we gave to our data
      //     title: value['question'].toString(), // title of the question
      //     options: Map.castFrom(value['ops']), // options of the question
      //   );
      //   // add to newQuestions
      //   newQuestions.add(newQuestion);
      // });

      return newQuestions;
    });
  }
}
