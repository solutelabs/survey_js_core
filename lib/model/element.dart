import 'question.dart';
import 'question_text.dart';
import 'package:survey_js_core/exceptions.dart';
import 'question_checkbox.dart';
import 'question_radio.dart';

class Element {
  List<QuestionModel> questions;

  Element() {
    questions = List();
  }

  List<QuestionModel> parseAllQuestion(Map<String, dynamic> json) {
    try {
      questions =
          (json["elements"] as List<Map<String, dynamic>>)?.map((question) {
        switch (question["type"]) {
          case "text":
            return QuestionTextModel(question);
          case "checkbox":
            return QuestionCheckboxModel(question);
          case "radiogroup":
            return QuestionRadioModel(question);
          default:
            throw InvalidTypeException("type not match");
        }
      })?.toList();
      return questions;
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }
}
