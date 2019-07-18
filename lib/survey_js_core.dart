library survey_js_core;

import 'model/element.dart';
import 'model/question.dart';

class SurveyJsonParser {
  List<QuestionModel> parseAllQuestion(Map<String, dynamic> json) {
    Element element = Element();
    return element.parseAllQuestion(json);
  }
}
