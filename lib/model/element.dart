import 'question.dart';
import 'question_text.dart';
import 'package:survey_js_core/exceptions.dart';
import 'question_checkbox.dart';
import 'question_radio.dart';

class ElementSurvey {
  List<QuestionModel> questions;

  ElementSurvey(List<Map<String, dynamic>> elements) {
    try {
      questions =
          (elements)?.map((question) {
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
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }
}
