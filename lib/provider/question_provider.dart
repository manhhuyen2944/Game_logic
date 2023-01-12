import 'package:flutter/cupertino.dart';
import 'package:project_threeh/model/question.dart';
import 'package:project_threeh/service/question_service.dart';
import 'package:project_threeh/model/question_user.dart';

class QuizProvider extends ChangeNotifier {
  int totalTime = 0;
  List<Question> questions = [];
  List<QuizUser> users = [];
  QuizProvider() {
    QuizService.getAllQuestions().then((value) {
      questions = value;
      notifyListeners();
    });
    QuizService.getTotalTime().then((value) {
      totalTime = value;
      notifyListeners();
    });
    Future<void> getAllUsers() async {
      users = await QuizService.getAllUsers();
      notifyListeners();
    }

    // Future<void> updateHighscore(int currentScore) async {
    //   await QuizService.updateHighscore(currentScore);
    // }
  }
}
