library survey_js_core;

import 'model/question_text.dart';
import 'exceptions.dart';
import 'model/question_checkbox.dart';

class SurveyJsonParser {
  QuestionTextModel parseQuestionTypeText(Map<String, dynamic> json) {
    if (json["type"] == "text") {
      try {
        final questionTextModel = QuestionTextModel(json);
        return questionTextModel.parseQuestionTypeText(json);
      } catch (exception) {
        throw Exception();
      }
    } else {
      throw InvalidTypeException("type not match");
    }
  }

  QuestionCheckboxModel parseQuestionTypeCheckbox(Map<String, dynamic> json) {
    if (json["type"] == "checkbox") {
      try{
       final questionCheckboxModel=QuestionCheckboxModel(json);
       return questionCheckboxModel.parseQuestionTypeCheckbox(json);
      }catch(exception){
        throw exception;
      }
    } else {
      throw InvalidTypeException("type not match");
    }
  }
}
