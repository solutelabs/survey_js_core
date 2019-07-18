library survey_js_core;

import 'model/question_text.dart';
import 'exceptions.dart';
import 'model/question_checkbox.dart';
import 'model/question_radio.dart';

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
      throw InvalidTypeException("${json["type"]} type not match with text");
    }
  }

  QuestionCheckboxModel parseQuestionTypeCheckbox(Map<String, dynamic> json) {
    if (json["type"] == "checkbox") {
      try {
        final questionCheckboxModel = QuestionCheckboxModel(json);
        return questionCheckboxModel.parseQuestionTypeCheckbox(json);
      } catch (exception) {
        throw exception;
      }
    } else {
      throw InvalidTypeException(
          "${json["type"]} type not match with checkbox");
    }
  }

  QuestionRadioModel parseQuestionTypeRadioGroup(Map<String, dynamic> json) {
    if (json["type"] == "radiogroup") {
      try {
        final questionRadioGroup=QuestionRadioModel(json);
        return questionRadioGroup.parseRadioGroupModel(json);
      } catch (exception) {
        throw exception;
      }
    } else {
      throw InvalidTypeException(
          "${json["type"]} type not match with radiogroup");
    }
  }
}
