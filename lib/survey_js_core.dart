library survey_js_core;

import 'model/page.dart';
import 'model/survey.dart';

class SurveyJsonParser {
  Survey parseSurveyJson(Map<String, dynamic> json) {
    Survey survey = Survey(json);
    survey.pages = parseAllPages(json);
    return survey;
  }

  List<PageModel> parseAllPages(Map<String, dynamic> json) {
    var pages = (json["pages"] as List<Map<String, dynamic>>)?.map((page) {
      final pageModel = PageModel(page);
      return pageModel;
    })?.toList();
    return pages;
  }
}
