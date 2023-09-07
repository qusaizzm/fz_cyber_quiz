import 'package:http/http.dart' as http; // the http package
import './question_model.dart';
import 'dart:convert';

class DBconnect {
  Future<List<Question>> fetchQuestions(quizName) async {
    // we got the data from just using t
    //his. now let's print it to see what we got.
    var path = 'https://quiz-c6d98-default-rtdb.firebaseio.com/$quizName.json';
    final url = Uri.parse(path);

    return http.get(url).then((response) {
      var data = json.decode(response.body);

      List<Question> newQuestions = [];
      if (data != null) {
        for (var i in data) {
          var newQuestion = Question(
            id: i.toString(), // the encrypted key/the title we gave to our data
            title: i['question'].toString(), // title of the question
            options: Map.castFrom(i['ops']), // options of the question
          );
          // ** add to newQuestions
          newQuestions.add(newQuestion);
        }
      }

      return newQuestions;
    });
  }
}
