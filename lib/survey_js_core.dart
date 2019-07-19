library survey_js_core;

import 'model/page.dart';

class SurveyJsonParser {
  List<PageModel> parseAllPages(Map<String, dynamic> json) {
   var pages= (json["pages"] as List<Map<String, dynamic>>)?.map((page) {
      PageModel pageModel=PageModel(page);
      return pageModel;
    })?.toList();
   return pages;
  }
}
