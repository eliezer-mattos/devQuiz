import 'package:devquiz/utils/database_repository.dart';
import 'package:devquiz/utils/status.dart';
import 'package:devquiz/models/quiz.dart';
import 'package:devquiz/models/user.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<StatusState>(StatusState.empty);
  set state(StatusState state) => stateNotifier.value = state;

  StatusState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = DatabaseRepository();

  void getUser() async {
    state = StatusState.loading;
    user = await repository.getUser();
    state = StatusState.success;
  }

  void getQuizzes() async {
    state = StatusState.loading;  
    quizzes = await repository.getQuizzes();
    state = StatusState.success;
  }
}